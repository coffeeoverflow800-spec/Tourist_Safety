const express = require("express");
const aiController = require("../Controllers/aiController");
const authController = require("../Controllers/authController");

const router = express.Router();

// Route to trigger anomaly detection, requires authentication.
// It will likely take a stream of location data or report data from the body.
router.post(
  "/detect-anomaly",
  authController.protect,
  aiController.detectAnomaly
);

// Route to classify a report using NLP, requires authentication.
router.post(
  "/classify-report",
  authController.protect,
  aiController.classifyReport
);

module.exports = router;
