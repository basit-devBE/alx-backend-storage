-- Creates a table with unique users


DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(255),
    country VARCHAR(50) NOT NULL DEFAULT 'US',
    CHECK (country IN ('US', 'CO', 'TN'))
);

