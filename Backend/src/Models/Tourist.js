const mongoose = require("mongoose");
const validator = require("validator");

const touristSchema = new mongoose.Schema({
  // Personal and travel information
  dateOfBirth: {
    type: Date,
    required: [true, "Date of birth is required"],
  },
  nationality: {
    type: String,
    required: [true, "Nationality is required"],
    trim: true,
  },
  address: {
    type: String,
    required: [true, "Address is required"],
    trim: true,
  },
  city: {
    type: String,
    required: [true, "City is required"],
    trim: true,
  },
  postalCode: {
    type: String,
    required: [true, "Postal code is required"],
    trim: true,
  },
  emergencyContactName: {
    type: String,
    required: [true, "Emergency contact name is required"],
    trim: true,
  },
  emergencyContactPhone: {
    type: String,
    required: [true, "Emergency contact phone is required"],
    trim: true,
    validate: {
      validator: function (v) {
        return /^\+?[0-9]{7,15}$/.test(v);
      },
      message: (props) => `${props.value} is not a valid phone number!`,
    },
  },

  // Document and identity verification
  documentType: {
    type: String,
    required: [true, "Document type is required"],
    enum: ["Passport", "National ID", "Driver's License"],
  },
  documentNumber: {
    type: String,
    required: [true, "Document number is required"],
    trim: true,
    unique: true,
  },
  frontOfDocument: {
    type: String, // Storing URL or file path
    required: [true, "Front of document is required"],
  },
  backOfDocument: {
    type: String, // Storing URL or file path
    required: [true, "Back of document is required"],
  },
  selfiePhoto: {
    type: String, // Storing URL or file path
    required: [true, "Selfie photo is required"],
  },

  // Optional fields
  purposeOfTravel: {
    type: String,
    trim: true,
  },
  medicalConditions: {
    type: String,
    trim: true,
  },

  // Timestamps for creation and update
  timestamps: {
    createdAt: { type: Date, default: Date.now },
    updatedAt: { type: Date, default: Date.now },
  },
});

const Tourist = mongoose.model("Tourist", touristSchema);

module.exports = Tourist;
