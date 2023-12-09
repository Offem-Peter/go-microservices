package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	"github.com/Offem-Peter/go-microservices/authentication-service/data"
)

const webPort = "80"

type Config struct {
	DB     *sql.DB
	Models data.Models
}

func main() {
	log.Println("Starting authentication service")

	app := Config{}

	srv := &http.Server{
		Addr:    fmt.Sprintf(":%s", webPort),
		Handler: app.routes(),
	}

	if err := srv.ListenAndServe(); err != nil {
		log.Panic(err)
	}

}
