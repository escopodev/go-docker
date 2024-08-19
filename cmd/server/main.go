package main

import (
	"log"
	"net/http"
)

var Version = ""

func main() {
	mux := http.NewServeMux()

	mux.HandleFunc("/versions", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte(Version))
	})

	if err := http.ListenAndServe(":8080", mux); err != nil {
		log.Fatal(err)
	}
}
