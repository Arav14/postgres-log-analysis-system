# Procedure for inserting logs via function
CREATE OR REPLACE FUNCTION insert_log(
    p_user_id INT,
    p_app_id INT,
    p_level VARCHAR,
    p_event VARCHAR,
    p_ip VARCHAR,
    p_response INT
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO logs(user_id, app_id, log_level, event_type, ip_address, response_time_ms)
    VALUES (p_user_id, p_app_id, p_level, p_event, p_ip, p_response);
END;
$$ LANGUAGE plpgsql;
