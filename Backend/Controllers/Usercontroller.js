const User = require("../Models/User");
const jwt = require("jsonwebtoken");
const { promisify } = require("util");

// Helper function to create and send a JWT token.
const signToken = (id) => {
  return jwt.sign({ id }, process.env.JWT_SECRET, {
    expiresIn: process.env.JWT_EXPIRES_IN,
  });
};

const createSendToken = (user, statusCode, res) => {
  const token = signToken(user._id);
  const cookieOptions = {
    expires: new Date(
      Date.now() + process.env.JWT_COOKIE_EXPIRES_IN * 24 * 60 * 60 * 1000
    ),
    httpOnly: true, // Prevents client-side JavaScript from reading the cookie.
  };
  if (process.env.NODE_ENV === "production") cookieOptions.secure = true;

  res.cookie("jwt", token, cookieOptions);

  // Remove password from output
  user.password = undefined;

  res.status(statusCode).json({
    status: "success",
    token,
    data: {
      user,
    },
  });
};

// Controller function for user sign-up.
exports.signup = async (req, res, next) => {
  try {
    const newUser = await User.create({
      firstName: req.body.firstName,
      lastName: req.body.lastName,
      email: req.body.email,
      phoneNumber: req.body.phoneNumber,
      password: req.body.password,
      confirmPassword: req.body.confirmPassword,
      agreedToTerms: req.body.agreedToTerms,
    });

    createSendToken(newUser, 201, res);
  } catch (err) {
    // Send a 400 response for validation errors.
    res.status(400).json({
      status: "fail",
      message: err.message,
    });
  }
};

// Controller function for user login.
exports.login = async (req, res, next) => {
  const { email, password } = req.body;

  // 1) Check if email and password exist.
  if (!email || !password) {
    return res.status(400).json({
      status: "fail",
      message: "Please provide email and password!",
    });
  }

  // 2) Check if user exists and password is correct.
  const user = await User.findOne({ email }).select("+password");

  if (!user || !(await user.correctPassword(password, user.password))) {
    return res.status(401).json({
      status: "fail",
      message: "Incorrect email or password",
    });
  }

  // 3) If everything is okay, send token to client.
  createSendToken(user, 200, res);
};

// Middleware to protect routes.
exports.protect = async (req, res, next) => {
  // 1) Get token and check if it exists.
  let token;
  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith("Bearer")
  ) {
    token = req.headers.authorization.split(" ")[1];
  } else if (req.cookies.jwt) {
    token = req.cookies.jwt;
  }

  if (!token) {
    return res.status(401).json({
      status: "fail",
      message: "You are not logged in! Please log in to get access.",
    });
  }

  // 2) Validate the token.
  const decoded = await promisify(jwt.verify)(token, process.env.JWT_SECRET);

  // 3) Check if user still exists.
  const currentUser = await User.findById(decoded.id);
  if (!currentUser) {
    return res.status(401).json({
      status: "fail",
      message: "The user belonging to this token no longer exists.",
    });
  }

  // 4) Grant access to protected route.
  req.user = currentUser;
  next();
};
