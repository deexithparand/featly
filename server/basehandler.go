package server

import (
	"featly/db"
	"fmt"
	"net/http"
)

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
