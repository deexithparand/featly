package db

import (
	"database/sql"
	"featly/config"
	"sync"

	_ "github.com/lib/pq" // PostgreSQL driver
)

var (
	instance *sql.DB
	once     sync.Once
)

func GetDBInstance() *sql.DB {

	once.Do(func() {

		appConfig := config.GetAppConfig()

		var err error

		instance, err = sql.Open("postgres", appConfig.DSN)
		if err != nil {
			panic(err)
		}

		err = instance.Ping()
		if err != nil {
			panic(err)
		}

	})

	return instance
}

func CloseDBInstance() {
	if instance != nil {
		instance.Close()
	}
}
