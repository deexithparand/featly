-- Ensure the UUID extension is enabled
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Clear existing data
DELETE FROM feature_tags;
DELETE FROM feature_requests;
DELETE FROM clients;

-- Insert Clients
INSERT INTO clients (client_id, client_name, subdomain) VALUES
(uuid_generate_v4(), 'all the best', 'atb'),
(uuid_generate_v4(), 'best of luck', 'bof');

-- Insert Features (Retrieve valid `client_id` dynamically)
INSERT INTO feature_requests (feature_id, feature_title, feature_details, upvote_count, client_id)
VALUES
(uuid_generate_v4(), 'Dark Mode', 'Dark mode is not working on home page', 5, (SELECT client_id FROM clients WHERE subdomain = 'atb')),
(uuid_generate_v4(), 'Export to CSV', 'Export functionality working for excel and not for CSV', 2, (SELECT client_id FROM clients WHERE subdomain = 'bof')),
(uuid_generate_v4(), 'Login Timeout', 'User session times out too quickly', 3, (SELECT client_id FROM clients WHERE subdomain = 'atb')),
(uuid_generate_v4(), 'Mobile Responsiveness', 'Navbar breaks on small screen devices', 4, (SELECT client_id FROM clients WHERE subdomain = 'bof')),
(uuid_generate_v4(), 'Search Bar', 'Search functionality is slow and inaccurate', 6, (SELECT client_id FROM clients WHERE subdomain = 'atb')),
(uuid_generate_v4(), 'Real-Time Notifications', 'Users are not receiving alerts in real-time', 7, (SELECT client_id FROM clients WHERE subdomain = 'bof')),
(uuid_generate_v4(), 'Analytics Dashboard', 'Need summary charts and export in dashboard', 8, (SELECT client_id FROM clients WHERE subdomain = 'atb')),
(uuid_generate_v4(), 'Multi-language Support', 'Need to support French and German', 3, (SELECT client_id FROM clients WHERE subdomain = 'bof')),
(uuid_generate_v4(), 'File Upload Limit', 'Increase limit from 10MB to 100MB', 4, (SELECT client_id FROM clients WHERE subdomain = 'atb')),
(uuid_generate_v4(), 'User Role Management', 'Allow custom roles and permissions per project', 5, (SELECT client_id FROM clients WHERE subdomain = 'bof'));

-- Insert Tags (Retrieve valid `feature_id` dynamically)
INSERT INTO feature_tags (tag_id, tag_name, color, feature_id)
VALUES
(uuid_generate_v4(), 'Pending', 'violet', (SELECT feature_id FROM feature_requests WHERE feature_title = 'Dark Mode')),
(uuid_generate_v4(), 'Popular', 'red', (SELECT feature_id FROM feature_requests WHERE feature_title = 'Export to CSV')),
(uuid_generate_v4(), 'Active', 'green', (SELECT feature_id FROM feature_requests WHERE feature_title = 'Dark Mode')),
(uuid_generate_v4(), 'Bug', 'orange', (SELECT feature_id FROM feature_requests WHERE feature_title = 'Login Timeout')),
(uuid_generate_v4(), 'UI', 'blue', (SELECT feature_id FROM feature_requests WHERE feature_title = 'Mobile Responsiveness'));
