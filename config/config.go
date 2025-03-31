package config

import (
	"os"

	"github.com/joho/godotenv"
)

type Config struct {
	DSN string
}

func LoadConfig() {

	// load once env
	err := godotenv.Load()
	if err != nil {
		panic(err)
	}

}

func GetAppConfig() *Config {
	return &Config{
		DSN: os.Getenv("DB_CONNECTION"),
	}
}
