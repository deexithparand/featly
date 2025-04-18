package db

import (
	"featly/utils"
	"fmt"
	"os"
)

func MigrateDB() {

	// DB connection
	db := GetDBInstance()

	// Migrations
	absPath, _ := os.Getwd() // Get working directory
	migrations_query := utils.ReadFileContents(absPath + "/db/migrate.sql")

	// executing the migrations.sql
	_, err := db.Exec(migrations_query)
	if err != nil {
		panic(err)
	}

	fmt.Println("Migrations Completed ...")

	// not closing the connection
}
