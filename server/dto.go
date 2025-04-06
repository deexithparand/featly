package server

type FeatureRequestRow struct {
	ClientID   string `json:"client_id"`
	ClientName string `json:"client_name"`
	Subdomain  string `json:"subdomain"`

	FeatureID     string `json:"feature_id"`
	FeatureTitle  string `json:"feature_title"`
	FeatureDetail string `json:"feature_detail"`

	UpvoteCount int `json:"upvote_count"`

	TagID   string `json:"tag_id"`
	TagName string `json:"tag_name"`
}
