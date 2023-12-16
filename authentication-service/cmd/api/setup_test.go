package main

import (
	"os"
	"testing"

	"github.com/Offem-Peter/go-microservices/authentication-service/data"
)

var testApp Config

func TestMain(m *testing.M) {

	repo := data.NewPostgresRepository(nil)
	testApp.Repo = repo
	os.Exit(m.Run())
}
