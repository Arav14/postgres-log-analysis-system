# Implement Partitioning
CREATE TABLE logs_partitioned (
    log_id BIGSERIAL,
    user_id INT,
    app_id INT,
    log_level VARCHAR(20),
    event_type VARCHAR(100),
    message TEXT,
    ip_address VARCHAR(50),
    response_time_ms INT,
    created_at TIMESTAMP
) PARTITION BY RANGE (created_at);
