const express = require("express");
const touristController = require("../Controllers/Touristcontroller");

const router = express.Router();

router
  .route("/")
  .get(touristController.getAllTourists)
  .post(touristController.createTourist);

router
  .route("/:id")
  .get(touristController.getTourist)
  .patch(touristController.updateTourist)
  .delete(touristController.deleteTourist);

module.exports = router;
