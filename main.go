// main.go
package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "ver 2. Hello, you've requested: %s\n", r.URL.Path)
	})

	http.HandleFunc("/healthCheck", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		w.Write([]byte("OK"))
	})
	
	http.ListenAndServe(":8080", nil)
}
