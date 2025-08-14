-- Create a separate schema
CREATE SCHEMA IF NOT EXISTS sample_schema;

-- Create table inside sample_schema
CREATE TABLE IF NOT EXISTS sample_schema.sample_users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255) NOT NULL,
  Gender VARCHAR(255),
  age VARCHAR(20),
  phone VARCHAR(20),
  address VARCHAR(255) NOT NULL,
  status VARCHAR(50) DEFAULT 'active',
  last_login TIMESTAMP,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_sample_users_email ON sample_schema.sample_users(email);
CREATE INDEX IF NOT EXISTS idx_sample_users_status ON sample_schema.sample_users(status);
CREATE INDEX IF NOT EXISTS idx_sample_users_last_login ON sample_schema.sample_users(last_login);
