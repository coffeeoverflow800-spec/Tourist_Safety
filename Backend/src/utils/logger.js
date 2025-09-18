// A simple logging utility for the backend application.
const fs = require("fs");
const path = require("path");

// Define the path to the log file.
const logFilePath = path.join(__dirname, "../../logs/app.log");

// Ensure the logs directory exists.
if (!fs.existsSync(path.join(__dirname, "../../logs"))) {
  fs.mkdirSync(path.join(__dirname, "../../logs"));
}

// Function to log a message with a timestamp.
const log = (message, level = "info") => {
  const timestamp = new Date().toISOString();
  const logMessage = `[${timestamp}] [${level.toUpperCase()}]: ${message}\n`;

  // Append the log message to the log file.
  fs.appendFile(logFilePath, logMessage, (err) => {
    if (err) {
      console.error("Failed to write to log file:", err);
    }
  });

  // Also log to the console for real-time monitoring.
  console.log(logMessage.trim());
};

// Export different logging levels for ease of use.
exports.info = (message) => log(message, "info");
exports.warn = (message) => log(message, "warn");
exports.error = (message) => log(message, "error");
exports.debug = (message) => log(message, "debug");

// Example usage:
// logger.info('API call received for /tourists');
// logger.error('Database connection failed', err);
