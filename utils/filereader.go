package utils

import (
	"os"
)

func ReadFileContents(path string) string {
	contentInBytes, err := os.ReadFile(path)
	if err != nil {
		panic(err)
	}
	return string(contentInBytes)
}
