package server

import (
	"featly/config"
	"featly/db"
	"net/http"

	"github.com/go-chi/chi"
)

func StartServer() {

	// load config
	config.LoadConfig()

	// load db
	db.MigrateDB()
	db.SeedDB()

	// server setup
	router := chi.NewRouter()

	router.Get("/", BaseHandler)

	// listening to the server
	err := http.ListenAndServe(":3000", router)
	if err != nil {
		panic(err)
	}
}
