const axios = require("axios");
const LocationLog = require("../Models/LocationLog");
const Report = require("../Models/Report");

// Controller function to detect anomalies in location data.
exports.detectAnomaly = async (req, res) => {
  try {
    const { touristId } = req.body;

    // This is a simplified example. In a real-world scenario, you would
    // send a stream or batch of location data for a specific tourist to the Python service.
    const locationData = await LocationLog.find({ tourist: touristId }).sort({
      timestamp: 1,
    });

    if (locationData.length === 0) {
      return res.status(404).json({
        status: "fail",
        message: "No location data found for this tourist.",
      });
    }

    // Send data to the external Python ML service.
    const response = await axios.post(
      "http://localhost:5000/api/v1/anomaly-detection",
      { data: locationData }
    );

    res.status(200).json({
      status: "success",
      data: response.data,
    });
  } catch (err) {
    res.status(500).json({
      status: "error",
      message: "Failed to detect anomaly.",
      error: err.message,
    });
  }
};

// Controller function to classify a report using NLP.
exports.classifyReport = async (req, res) => {
  try {
    const { reportId } = req.body;

    const report = await Report.findById(reportId);

    if (!report) {
      return res.status(404).json({
        status: "fail",
        message: "No report found with that ID.",
      });
    }

    // Send the report text to the external Python NLP service.
    const response = await axios.post(
      "http://localhost:5000/api/v1/report-classification",
      { text: report.description }
    );

    res.status(200).json({
      status: "success",
      data: response.data,
    });
  } catch (err) {
    res.status(500).json({
      status: "error",
      message: "Failed to classify report.",
      error: err.message,
    });
  }
};
