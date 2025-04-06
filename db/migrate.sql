-- CLIENT TABLE
CREATE TABLE IF NOT EXISTS clients (
    client_id VARCHAR(50) NOT NULL UNIQUE PRIMARY KEY,  -- Renamed from 'id'
    client_name VARCHAR(50) NOT NULL UNIQUE,            -- Renamed from 'client' for clarity
    subdomain VARCHAR(50) NOT NULL UNIQUE
);

-- FEATURE REQUEST TABLE
CREATE TABLE IF NOT EXISTS feature_requests (
    feature_id VARCHAR(50) NOT NULL UNIQUE PRIMARY KEY, -- Renamed from 'id'
    feature_title VARCHAR(50),                          -- Renamed from 'feature' for clarity
    feature_details VARCHAR(100),                       -- Renamed from 'details'
    upvote_count INT DEFAULT 0,                         -- Renamed from 'upvotes' for clarity

    -- REFERENCE VARIABLES
    client_id VARCHAR(50) NOT NULL,

    -- FOREIGN KEY REFERENCES
    FOREIGN KEY (client_id) REFERENCES clients(client_id) ON DELETE CASCADE
);

-- TAG TABLE
CREATE TABLE IF NOT EXISTS feature_tags (  -- Renamed from 'tags' to 'feature_tags' for specificity
    tag_id VARCHAR(50) NOT NULL UNIQUE PRIMARY KEY,  -- Renamed from 'id'
    tag_name VARCHAR(50) UNIQUE,                     -- Renamed from 'tag' for clarity
    color VARCHAR(50) UNIQUE,
    
    -- REFERENCE VARIABLES
    feature_id VARCHAR(50) NOT NULL,

    -- FOREIGN KEY REFERENCES
    FOREIGN KEY (feature_id) REFERENCES feature_requests(feature_id) ON DELETE CASCADE
);
