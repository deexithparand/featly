SELECT 

    -- client cols
    clients.client_id,
    clients.client_name,
    clients.subdomain,

    -- feature cols
    feature_requests.feature_id,
    feature_requests.feature_title,
    feature_requests.feature_details,
    feature_requests.upvote_count,

    -- tags for feature
    feature_tags.tag_id,
    feature_tags.tag_name
    
FROM clients 
INNER JOIN feature_requests ON clients.client_id = feature_requests.client_id
INNER JOIN feature_tags ON feature_requests.feature_id = feature_tags.feature_id
ORDER BY clients.client_id, feature_requests.feature_id, feature_tags.tag_id;
