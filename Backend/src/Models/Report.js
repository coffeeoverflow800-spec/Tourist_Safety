const mongoose = require("mongoose");

const reportSchema = new mongoose.Schema({
  // A reference to the Tourist who filed the report.
  tourist: {
    type: mongoose.Schema.ObjectId,
    ref: "Tourist",
    required: [true, "A report must belong to a tourist"],
  },
  // The date and time the report was filed.
  timestamp: {
    type: Date,
    default: Date.now,
    required: true,
  },
  // The description of the incident. This is the text that the NLP service will classify.
  description: {
    type: String,
    required: [true, "A report must have a description"],
    trim: true,
  },
  // The type of incident (e.g., "Theft", "Medical Emergency"). This can be set by the client or
  // automatically by the NLP service.
  incidentType: {
    type: String,
    enum: [
      "Theft",
      "Medical Emergency",
      "Harassment",
      "Lost Item",
      "Traffic Incident",
      "Natural Disaster",
      "Scam",
      "Assault",
      "Other",
    ],
    default: "Other",
  },
  // The location where the incident occurred.
  location: {
    type: {
      type: String,
      enum: ["Point"],
      required: true,
    },
    coordinates: {
      type: [Number],
      required: true,
    },
  },
  // An array to store file paths or URLs of media related to the report.
  media: [String],

  // The current status of the report (e.g., "Pending", "In Progress", "Resolved").
  status: {
    type: String,
    enum: ["Pending", "In Progress", "Resolved", "Archived"],
    default: "Pending",
  },
});

const Report = mongoose.model("Report", reportSchema);

module.exports = Report;
