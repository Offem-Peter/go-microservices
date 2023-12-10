package main

import (
	"fmt"
	"log"
	"net/http"
)

type Config struct{}

const webPort = "80"

func main() {
	app := Config{}

	srv := &http.Server{
		Addr:    fmt.Sprintf(":%s", webPort),
		Handler: app.routes(),
	}

	log.Println("Starting mail service on port ", webPort)

	if err := srv.ListenAndServe(); err != nil {
		log.Panic(err)
	}
}
