// -- It is designed to be run as a migration or initial setup script.

// -- Create a UUID extension if not already present, as it is a common practice for primary keys.
// CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

// -- Create the users table to store backend user information.
// CREATE TABLE users (
//     id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
//     first_name VARCHAR(50) NOT NULL,
//     last_name VARCHAR(50) NOT NULL,
//     email VARCHAR(255) UNIQUE NOT NULL,
//     phone_number VARCHAR(20) UNIQUE NOT NULL,
//     password_hash VARCHAR(255) NOT NULL,
//     role VARCHAR(50) NOT NULL CHECK (role IN ('admin', 'police', 'tourism_dept')),
//     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
//     updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
// );

// -- Create a function to update the updated_at column automatically on each row update.
// CREATE OR REPLACE FUNCTION set_updated_at_column()
// RETURNS TRIGGER AS $$
// BEGIN
//     NEW.updated_at = NOW();
//     RETURN NEW;
// END;
// $$ language 'plpgsql';

// -- Create a trigger that calls the function before an update on the users table.
// CREATE TRIGGER set_updated_at
// BEFORE UPDATE ON users
// FOR EACH ROW
// EXECUTE PROCEDURE set_updated_at_column();
