package main

import (
	"context"
	"featly/db"
	"featly/server"
	"fmt"
	"os"
	"os/signal"
	"syscall"
)

func waitForInterrupt() context.Context {

	// signals to be monitored
	signals := make(chan os.Signal, 1)
	signalsToBeHandled := []os.Signal{
		syscall.SIGINT,  // Ctrl+C
		syscall.SIGTSTP, // Ctrl+Z
		syscall.SIGTERM, // Kill signal
		syscall.SIGHUP,  // Terminal closed
	}

	ctx, cancel := context.WithCancel(context.Background())
	signal.Notify(signals, signalsToBeHandled...)

	go func() {
		<-signals
		cancel()
	}()

	return ctx
}

// first go routine
func main() {
	ctx := waitForInterrupt()

	// second goroutine
	go server.StartServer()

	<-ctx.Done()
	fmt.Println("Received shutdown signal")

	// graceful shutdown time

	db.CloseDBInstance()
}
