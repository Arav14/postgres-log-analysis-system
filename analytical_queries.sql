# Detect Failed Login Attempts
SELECT user_id, COUNT(*) AS failed_attempts
FROM logs
WHERE event_type = 'LOGIN_FAILED'
GROUP BY user_id
HAVING COUNT(*) >= 3;


# Peak Traffic Hour
SELECT DATE_TRUNC('hour', created_at) AS hour,
       COUNT(*) AS total_requests
FROM logs
GROUP BY hour
ORDER BY total_requests DESC;


# Error Rate Calculation
SELECT 
COUNT(*) FILTER (WHERE log_level='ERROR') * 100.0 / COUNT(*) 
AS error_percentage
FROM logs;


# Slow API Detection
SELECT *
FROM logs
WHERE response_time_ms > 500;


# Top 3 Most Active Users Per Application
SELECT *
FROM (
    SELECT 
        a.app_name,
        u.username,
        COUNT(l.log_id) AS total_logs,
        RANK() OVER (PARTITION BY a.app_name ORDER BY COUNT(l.log_id) DESC) AS rank_position
    FROM logs l
    JOIN users u ON l.user_id = u.user_id
    JOIN applications a ON l.app_id = a.app_id
    GROUP BY a.app_name, u.username
) ranked
WHERE rank_position <= 3;
