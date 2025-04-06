package server

import (
	"featly/db"
	"fmt"
	"net/http"
	"os"
)

func ListFeatureRequests() {

	database := db.GetDBInstance()

	absPath, _ := os.Getwd()

	featuresDataQuery, err := os.ReadFile(absPath + "/db/features.sql")
	if err != nil {
		panic(err)
	}

	rows, err := database.Query(string(featuresDataQuery))
	if err != nil {
		panic(err)
	}
	defer rows.Close()

	fmt.Println("Queried Features Data")

	// feature request row
	var frrSet []FeatureRequestRow

	for rows.Next() {

		var frr FeatureRequestRow

		err := rows.Scan(
			&frr.ClientID, &frr.ClientName, &frr.Subdomain,
			&frr.FeatureID, &frr.FeatureTitle, &frr.FeatureDetail, &frr.UpvoteCount,
			&frr.TagID, &frr.TagName,
		)

		if err != nil {
			panic(err)
		}

		frrSet = append(frrSet, frr)

	}

	for _, frr := range frrSet {
		fmt.Println(frr.Subdomain, " -> ", frr.FeatureTitle, " -> ", frr.FeatureDetail)
	}

}

func BaseHandler(w http.ResponseWriter, r *http.Request) {

	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Welcome to Featly"))

	ListFeatureRequests()

	// List feature requests
}
