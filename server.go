//go:generate  /home/juno/neonworkspace/gowork/bin/statik -src=./public

package main // import "github.com/remotejob/godocker"

import (
	"fmt"
	"log"
	"net/http"

	"gopkg.in/mgo.v2"

	"github.com/rakyll/statik/fs"
	_ "github.com/remotejob/godocker/statik"
)

//Employees title name
type Employees struct {
	Title string
	Name  string
}

func testhandler(w http.ResponseWriter, r *http.Request) {

	session, err := mgo.Dial("mongo")
	if err != nil {
		panic(err)
	}
	defer session.Close()
	session.SetMode(mgo.Monotonic, true)

	c := session.DB("node-mongo-employee").C("employees")

	result := []Employees{}
	err = c.Find(nil).All(&result)
	if err != nil {
		log.Fatal(err)
	}

	for _, empl := range result {
		fmt.Fprintf(w, "Hi  %s %s", empl.Name, empl.Title)
	}

}

func main() {
	statikFS, err := fs.New()
	if err != nil {
		log.Fatalf(err.Error())
	}

	http.HandleFunc("/test", testhandler)

	// fs := http.FileServer(http.Dir("/home/juno/neonworkspace/gowork/src/github.com/remotejob/godocker/assets"))
	fs := http.FileServer(http.Dir("assets"))

	http.Handle("/assets/", http.StripPrefix("/assets/", fs))
	// http.Handle("/assets", http.FileServer(http.Dir("/home/juno/neonworkspace/gowork/src/github.com/remotejob/godocker/assets")))
	http.Handle("/", http.FileServer(statikFS))
	http.ListenAndServe(":8080", nil)
}
