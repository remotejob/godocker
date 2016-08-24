package main // import "github.com/remotejob/hello/godocker"

import (
	"log"
	"net/http"

	"github.com/rakyll/statik/fs"
	_ "/home/juno/neonworkspace/gowork/src/github.com/remotejob/godocker/statik"
)

// Before buildling, run go generate.
// Then, run the main program and visit http://localhost:8080/public/hello.txt
func main() {
	statikFS, err := fs.New()
	if err != nil {
		log.Fatalf(err.Error())
	}

	http.Handle("/public/", http.StripPrefix("/public/", http.FileServer(statikFS)))
	http.ListenAndServe(":8080", nil)
}
