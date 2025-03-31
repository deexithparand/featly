-- CLIENT TABLE
CREATE TABLE IF NOT EXISTS clients (
    id VARCHAR(50) NOT NULL UNIQUE PRIMARY KEY,
    subdomain VARCHAR(50) NOT NULL UNIQUE 
);

-- FEATURE TABLE
CREATE TABLE IF NOT EXISTS features (
    id VARCHAR(50) NOT NULL UNIQUE PRIMARY KEY,
    feature VARCHAR(100),
    upvotes INT DEFAULT 0,

    -- references
    client_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE
);

-- CREATE TABLE IF NOT EXISTS clients (
--     id VARCHAR(50) NOT NULL UNIQUE PRIMARY KEY, 
--     subdomain VARCHAR(50) NOT NULL UNIQUE
-- );

-- -- FEATURE TABLE
-- CREATE TABLE IF NOT EXISTS features (
--     id VARCHAR(50) NOT NULL UNIQUE PRIMARY KEY,
--     feature VARCHAR(100), 
--     upvotes INT DEFAULT 0,

--     -- references
--     client_id VARCHAR(50) NOT NULL,
--     FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE
-- );

-- TAGS 