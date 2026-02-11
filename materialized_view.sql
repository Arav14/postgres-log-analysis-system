# Dashboard Optimization
CREATE MATERIALIZED VIEW daily_summary AS
SELECT 
DATE(created_at) AS day,
COUNT(*) AS total_logs,
COUNT(*) FILTER (WHERE log_level='ERROR') AS error_logs
FROM logs
GROUP BY day;
