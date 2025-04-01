package server

import (
	"featly/db"
	"fmt"
	"net/http"
)

type Client struct {
	ID        string    `json:"id"`
	Name      string    `json:"client_name"`
	Subdomain string    `json:"subdomain"`
	Features  []Feature `json:"features"`
}

type Feature struct {
	ID       string `json:"id"`
	Feature  string `json:"feature"`
	Upvotes  int    `json:"upvotes"`
	ClientID string `json:"client_id"`
	Tags     []Tag  `json:"tags"`
}

type Tag struct {
	ID        string `json:"id"`
	Tag       string `json:"tag"`
	FeatureID string `json:"feature_id"`
}

func ListFeatureRequests() {
	database := db.GetDBInstance()

	rows, err := database.Query("SELECT * FROM clients")
	if err != nil {
		panic(err)
	}
	defer rows.Close()

	for rows.Next() {
		var (
			id        string
			subdomain string
		)

		err := rows.Scan(&id, &subdomain)
		if err != nil {
			panic(err)
		}

		fmt.Println(id, subdomain)
	}
}

func BaseHandler(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Welcome to Featly"))

	// List feature requests
}
