# Create Table users
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

# Create Table applications
CREATE TABLE applications (
    app_id SERIAL PRIMARY KEY,
    app_name VARCHAR(100) NOT NULL,
    environment VARCHAR(20) CHECK (environment IN ('DEV','QA','PROD'))
);

# Create Table logs
CREATE TABLE logs (
    log_id BIGSERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    app_id INT REFERENCES applications(app_id),
    log_level VARCHAR(20) CHECK (log_level IN ('INFO','WARNING','ERROR','DEBUG')),
    event_type VARCHAR(100),
    message TEXT,
    ip_address VARCHAR(50),
    response_time_ms INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
