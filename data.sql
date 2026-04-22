
INSERT INTO Category (name, description) VALUES
('Social', 'Social networking and messaging'),
('Entertainment', 'Video and streaming platforms');


INSERT INTO App (app_name, category_id, platform) VALUES
('Instagram', 1, 'iOS'),
('YouTube', 2, 'Android');

INSERT INTO User (name, email) VALUES
('Rahul', 'rahul@gmail.com'),
('Priya', 'priya@gmail.com');


INSERT INTO Content (title, content_type, app_id) VALUES
('Friends Reel', 'video', 1),
('DBMS Tutorial', 'video', 2);


INSERT INTO Event (user_id, content_id, event_type, duration_sec, event_timestamp) VALUES
(1, 1, 'play', 120, '2026-04-01 10:00:00'),
(1, 2, 'watch', 60, '2026-04-01 11:30:00'),
(2, 1, 'play', 30, '2026-04-01 12:15:00');
