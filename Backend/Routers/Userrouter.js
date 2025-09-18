const express = require("express");
const authController = require("../Controllers/Usercontroller");

const router = express.Router();

// Define the sign-up and login routes.
router.post("/signup", Usercontroller.signup);
router.post("/login", Usercontroller.login);

module.exports = router;
