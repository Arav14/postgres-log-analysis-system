# users table
INSERT INTO users (username, email, created_at) VALUES
('arav', 'arav@gmail.com', '2024-12-01 09:00:00'),
('john_doe', 'john@gmail.com', '2024-12-02 10:00:00'),
('sara_khan', 'sara@gmail.com', '2024-12-03 11:00:00'),
('michael', 'michael@gmail.com', '2024-12-04 12:00:00'),
('priya_sharma', 'priya@gmail.com', '2024-12-05 13:00:00'),
('david_lee', 'david@gmail.com', '2024-12-06 14:00:00'),
('ananya', 'ananya@gmail.com', '2024-12-07 15:00:00'),
('rohit', 'rohit@gmail.com', '2024-12-08 16:00:00'),
('emma_watson', 'emma@gmail.com', '2024-12-09 17:00:00'),
('liam', 'liam@gmail.com', '2024-12-10 18:00:00');

# applications table
INSERT INTO applications (app_name, environment) VALUES
('EcommerceApp', 'PROD'),
('BankingApp', 'PROD'),
('InventorySystem', 'QA'),
('HRPortal', 'DEV'),
('AnalyticsDashboard', 'PROD');

# logs table
INSERT INTO logs 
(user_id, app_id, log_level, event_type, message, ip_address, response_time_ms, created_at)
SELECT
    (RANDOM()*9)::INT + 1 AS user_id,                -- 1 to 10
    (RANDOM()*4)::INT + 1 AS app_id,                 -- 1 to 5
    (ARRAY['INFO','ERROR','DEBUG','WARNING'])[floor(random()*4)+1],
    (ARRAY['LOGIN_SUCCESS','LOGIN_FAILED','PAYMENT_SUCCESS','PAYMENT_FAILED','API_CALL','SERVER_ERROR'])[floor(random()*6)+1],
    'System generated log entry',
    '192.168.1.' || (RANDOM()*255)::INT,
    (RANDOM()*1000)::INT,                            -- 0 to 1000 ms
    NOW() - (RANDOM()*INTERVAL '10 days')
FROM generate_series(1,200);
