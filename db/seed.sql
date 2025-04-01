-- Ensure the UUID extension is enabled
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

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
(uuid_generate_v4(), 'Dark Mode', "Dark mode isn't working on home page", 5, (SELECT id FROM clients WHERE subdomain = 'atb')),
(uuid_generate_v4(), 'Export to CSV', "Export functionality working for excel and not for CSV", 2, (SELECT id FROM clients WHERE subdomain = 'bof'));

-- Insert Tags (Retrieve valid `feature_id` dynamically)
INSERT INTO feature_tags (tag_id, tag_name, feature_id)
VALUES
(uuid_generate_v4(), 'Pending', (SELECT id FROM features WHERE feature = 'Dark Mode')),
(uuid_generate_v4(), 'Popular', (SELECT id FROM features WHERE feature = 'Export to CSV'));