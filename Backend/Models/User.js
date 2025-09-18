const mongoose = require("mongoose");
const validator = require("validator");
const bcrypt = require("bcryptjs");

// Define the User schema for MongoDB using Mongoose.
const userSchema = new mongoose.Schema({
  // Store first and last names.
  firstName: {
    type: String,
    required: [true, "First name is required"],
    trim: true,
  },
  lastName: {
    type: String,
    required: [true, "Last name is required"],
    trim: true,
  },
  // The user's email address, which must be unique.
  email: {
    type: String,
    required: [true, "Email address is required"],
    unique: true,
    lowercase: true,
    validate: [validator.isEmail, "Please provide a valid email"],
  },
  // The user's phone number.
  phoneNumber: {
    type: String,
    required: [true, "Phone number is required"],
    trim: true,
    validate: {
      validator: function (v) {
        return /^\+?[0-9]{7,15}$/.test(v);
      },
      message: (props) => `${props.value} is not a valid phone number!`,
    },
  },
  // The user's password. It will be hashed before being saved.
  password: {
    type: String,
    required: [true, "Password is required"],
    minlength: [8, "Password must be at least 8 characters long"],
    select: false, // Prevents the password from being returned in query results by default.
  },
  // Confirm password field for validation, not stored in the database.
  confirmPassword: {
    type: String,
    required: [true, "Please confirm your password"],
    validate: {
      // Custom validator to check if the password and confirmPassword match.
      // This only runs on `save()` and `create()`.
      validator: function (el) {
        return el === this.password;
      },
      message: "Passwords are not the same!",
    },
    select: false,
  },
  // Field to track if the user has agreed to terms.
  agreedToTerms: {
    type: Boolean,
    required: [true, "You must agree to the terms and privacy policy"],
    default: false,
  },
});

// Pre-save middleware to hash the password before saving the document.
userSchema.pre("save", async function (next) {
  // Only run this function if the password was actually modified.
  if (!this.isModified("password")) return next();

  // Hash the password with a cost of 12.
  this.password = await bcrypt.hash(this.password, 12);

  // Clear the confirmPassword field after validation to prevent it from being saved.
  this.confirmPassword = undefined;
  next();
});

// A method to compare a plain-text password with the hashed password in the database.
userSchema.methods.correctPassword = async function (
  candidatePassword,
  userPassword
) {
  return await bcrypt.compare(candidatePassword, userPassword);
};

const User = mongoose.model("User", userSchema);

module.exports = User;
