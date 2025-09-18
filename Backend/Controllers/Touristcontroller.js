const Tourist = require("../Models/Tourist");

// Controller function to create a new tourist
exports.createTourist = async (req, res) => {
  try {
    const newTourist = await Tourist.create(req.body);
    res.status(201).json({
      status: "success",
      data: {
        tourist: newTourist,
      },
    });
  } catch (err) {
    res.status(400).json({
      status: "fail",
      message: err.message,
    });
  }
};

// Controller function to get all tourists
exports.getAllTourists = async (req, res) => {
  try {
    const tourists = await Tourist.find();
    res.status(200).json({
      status: "success",
      results: tourists.length,
      data: {
        tourists,
      },
    });
  } catch (err) {
    res.status(404).json({
      status: "fail",
      message: err.message,
    });
  }
};

// Controller function to get a single tourist by ID
exports.getTourist = async (req, res) => {
  try {
    const tourist = await Tourist.findById(req.params.id);
    if (!tourist) {
      return res.status(404).json({
        status: "fail",
        message: "No tourist found with that ID",
      });
    }
    res.status(200).json({
      status: "success",
      data: {
        tourist,
      },
    });
  } catch (err) {
    res.status(400).json({
      status: "fail",
      message: err.message,
    });
  }
};

// Controller function to update a tourist by ID
exports.updateTourist = async (req, res) => {
  try {
    const tourist = await Tourist.findByIdAndUpdate(req.params.id, req.body, {
      new: true, // Returns the updated document
      runValidators: true, // Runs the validators defined in the schema
    });
    if (!tourist) {
      return res.status(404).json({
        status: "fail",
        message: "No tourist found with that ID",
      });
    }
    res.status(200).json({
      status: "success",
      data: {
        tourist,
      },
    });
  } catch (err) {
    res.status(400).json({
      status: "fail",
      message: err.message,
    });
  }
};

// Controller function to delete a tourist by ID
exports.deleteTourist = async (req, res) => {
  try {
    const tourist = await Tourist.findByIdAndDelete(req.params.id);
    if (!tourist) {
      return res.status(404).json({
        status: "fail",
        message: "No tourist found with that ID",
      });
    }
    res.status(204).json({
      status: "success",
      data: null,
    });
  } catch (err) {
    res.status(400).json({
      status: "fail",
      message: err.message,
    });
  }
};
