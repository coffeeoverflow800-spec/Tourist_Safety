const express = require("express");
const locationController = require("../Controllers/locationController");

const router = express.Router();

router.route("/").post(locationController.createLocationLog);

router.route("/:touristId").get(locationController.getTouristLocationLogs);

router
  .route("/:touristId/latest")
  .get(locationController.getLatestTouristLocation);

module.exports = router;
