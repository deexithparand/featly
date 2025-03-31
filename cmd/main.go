package main

import (
	"featly/db"
	"featly/server"
)

func main() {
	server.StartServer()
	db.CloseDBInstance()
}
