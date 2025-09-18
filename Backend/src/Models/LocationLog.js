const mongoose = require("mongoose");

const locationLogSchema = new mongoose.Schema({
  // A reference to the Tourist document. This links the location data to a specific tourist.
  tourist: {
    type: mongoose.Schema.ObjectId,
    ref: "Tourist", // The name of the model to which we are linking.
    required: [true, "Location log must belong to a Tourist"],
  },
  // The geographical coordinates of the location.
  location: {
    type: {
      type: String,
      enum: ["Point"], // 'location.type' must be 'Point'
      required: true,
    },
    coordinates: {
      type: [Number],
      required: true,
      index: "2dsphere", // This special index is required for geo-spatial queries.
    },
  },
  // The timestamp for when this location was recorded.
  timestamp: {
    type: Date,
    default: Date.now,
    required: true,
  },
});

const LocationLog = mongoose.model("LocationLog", locationLogSchema);

module.exports = LocationLog;
