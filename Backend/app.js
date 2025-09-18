const express = require("express");
const cookieParser = require("cookie-parser");
const dotenv = require("dotenv");
const { connectMongoDB } = require("./src/config/db");

// Load environment variables from .env file.
dotenv.config({ path: "./.env" });

// Initialize database connections
connectMongoDB();

const app = express();

// Middleware
app.use(express.json()); // Body parser for reading JSON data
app.use(cookieParser()); // Cookie parser for handling JWTs

// Import routers
const touristRouter = require("./src/Routers/Touristrouter");
const locationRouter = require("./src/Routers/locationRoutes");
const aiRouter = require("./src/Routers/aiRoutes");
const authRouter = require("./src/Routers/authRoutes");

// API Routes
// Mount the routers to their specific endpoints.
app.use("/api/v1/tourists", touristRouter);
app.use("/api/v1/locations", locationRouter);
app.use("/api/v1/ai", aiRouter);
app.use("/api/v1/users", authRouter);

// Start the server.
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`App running on port ${port}...`);
});

module.exports = app;
