# Indexes
CREATE INDEX idx_logs_user ON logs(user_id);
CREATE INDEX idx_logs_created_at ON logs(created_at);
CREATE INDEX idx_logs_event_type ON logs(event_type);
CREATE INDEX idx_logs_level ON logs(log_level);
