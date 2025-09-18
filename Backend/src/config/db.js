const mongoose = require("mongoose");
const { Pool } = require("pg");

// MongoDB Connection
const connectMongoDB = async () => {
  try {
    const mongoURI = process.env.MONGO_URI;
    await mongoose.connect(mongoURI, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    console.log("MongoDB connected successfully.");
  } catch (error) {
    console.error("MongoDB connection failed:", error.message);
    process.exit(1); // Exit process with failure
  }
};

// PostgreSQL Connection Pool
const pool = new Pool({
  user: process.env.PG_USER,
  host: process.env.PG_HOST,
  database: process.env.PG_DATABASE,
  password: process.env.PG_PASSWORD,
  port: process.env.PG_PORT,
});

const queryPostgreSQL = (text, params) => {
  return pool.query(text, params);
};

module.exports = {
  connectMongoDB,
  queryPostgreSQL,
};
