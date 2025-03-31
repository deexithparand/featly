package db

import (
	"featly/utils"
	"fmt"
	"os"
)

func SeedDB() {
	// DB connection
	db := GetDBInstance()

	// Migrations
	absPath, _ := os.Getwd() // Get working directory
	seed_query := utils.ReadFileContents(absPath + "/db/seed.sql")

	// executing the seed.sql
	_, err := db.Exec(seed_query)
	if err != nil {
		panic(err)
	}

	fmt.Println("Seeding Completed ...")

	// not closing the connection
}
