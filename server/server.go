package server

import (
	"featly/config"
	"featly/db"
	"net/http"

	"github.com/go-chi/chi"
)

func rootHandler(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Welcome to Featly"))
}

func StartServer() {

	// load config
	config.LoadConfig()

	// load db
	db.MigrateDB()

	// server setup
	router := chi.NewRouter()

	router.Get("/", rootHandler)

	err := http.ListenAndServe(":3000", router)
	if err != nil {
		panic(err)
	}
}
