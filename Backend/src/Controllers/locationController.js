const LocationLog = require("../Models/LocationLog");

// Controller function to create a new location log
exports.createLocationLog = async (req, res) => {
  try {
    const newLocationLog = await LocationLog.create(req.body);

    // Fetch the tourist document to get the emergency contact info
    const tourist = await Tourist.findById(req.body.tourist);

    if (
      tourist &&
      tourist.personalInfo &&
      tourist.personalInfo.emergencyContact
    ) {
      // Send an alert to the emergency contact
      const emergencyContactPhone =
        tourist.personalInfo.emergencyContact.phoneNumber;
      const message = `SOS Alert: Your emergency contact, ${tourist.personalInfo.name}, is sharing their location. Current location: Lat ${newLocationLog.location.coordinates[1]}, Lon ${newLocationLog.location.coordinates[0]}.`;

      // This assumes a function in your notifier utility
      // await notifier.sendSMS(emergencyContactPhone, message);
    }

    res.status(201).json({
      status: "success",
      data: {
        locationLog: newLocationLog,
      },
    });
  } catch (err) {
    res.status(400).json({
      status: "fail",
      message: err.message,
    });
  }
};

// Controller function to get all location logs for a specific tourist
exports.getTouristLocationLogs = async (req, res) => {
  try {
    const locationLogs = await LocationLog.find({
      tourist: req.params.touristId,
    });
    res.status(200).json({
      status: "success",
      results: locationLogs.length,
      data: {
        locationLogs,
      },
    });
  } catch (err) {
    res.status(404).json({
      status: "fail",
      message: err.message,
    });
  }
};

// Controller function to get the latest location log for a specific tourist
exports.getLatestTouristLocation = async (req, res) => {
  try {
    const latestLocation = await LocationLog.findOne({
      tourist: req.params.touristId,
    })
      .sort({ timestamp: -1 })
      .limit(1);

    if (!latestLocation) {
      return res.status(404).json({
        status: "fail",
        message: "No location logs found for this tourist",
      });
    }

    res.status(200).json({
      status: "success",
      data: {
        locationLog: latestLocation,
      },
    });
  } catch (err) {
    res.status(400).json({
      status: "fail",
      message: err.message,
    });
  }
};
