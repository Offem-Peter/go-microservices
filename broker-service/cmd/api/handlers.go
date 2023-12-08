package main

import (
	"log"
	"net/http"
)

func (app *Config) Broker(w http.ResponseWriter, r *http.Request) {
	payload := jsonResponse{
		Error:   false,
		Message: "Hit the broker",
	}

	err := app.writeJSON(w, http.StatusOK, payload, nil)

	if err != nil {
		log.Panic(err)
		w.WriteHeader(http.StatusInternalServerError)
	}
}
