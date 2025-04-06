package main

import (
	"featly/db"
	"featly/server"
	"fmt"
	"os"
	"os/signal"
	"syscall"
)

func handleInterruptSignals() os.Signal {

	waitForSignal := make(chan os.Signal, 1)

	signals := []os.Signal{
		syscall.SIGINT,  // Ctrl+C
		syscall.SIGTSTP, // Ctrl+Z
		syscall.SIGTERM, // Kill signal
		syscall.SIGHUP,  // Terminal closed
	}

	signal.Notify(waitForSignal, signals...)

	return <-waitForSignal
}

func receivedInterrupt(signal os.Signal) {
	fmt.Println("Received Signal : ", signal)

}

func main() {
	server.StartServer()

	gotSignal := handleInterruptSignals()
	receivedInterrupt(gotSignal)

	db.CloseDBInstance()
}
