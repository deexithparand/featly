-- Ensure the UUID extension is enabled
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DELETE FROM tags;
DELETE FROM features;
DELETE FROM clients;

-- Insert Clients
INSERT INTO clients (id, subdomain) VALUES
(uuid_generate_v4(), 'client1'),
(uuid_generate_v4(), 'client2');

-- Insert Features (Retrieve valid `client_id` dynamically)
INSERT INTO features (id, feature, upvotes, client_id)
VALUES
(uuid_generate_v4(), 'Dark Mode', 5, (SELECT id FROM clients WHERE subdomain = 'client1')),
(uuid_generate_v4(), 'Export to CSV', 2, (SELECT id FROM clients WHERE subdomain = 'client2'));

-- Insert Tags (Retrieve valid `feature_id` dynamically)
INSERT INTO tags (id, tag, feature_id)
VALUES
(uuid_generate_v4(), 'Pending', (SELECT id FROM features WHERE feature = 'Dark Mode')),
(uuid_generate_v4(), 'Popular', (SELECT id FROM features WHERE feature = 'Export to CSV'));