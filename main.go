package main

import (
	"flag"
	"fmt"
	"os"
	"strings"
)

// Version info.
var Version string

// CommitHash info.
var CommitHash string

var version bool
var args []string

func init() {
	flag.BoolVar(&version, "version", false, "Show version information")
	flag.Parse()
}

func main() {
	args = flag.Args()

	// Print Version
	if version == true {
		fmt.Printf("version: %v\n", Version)
		fmt.Printf("commit:  %v\n", CommitHash)
		os.Exit(0)
	}

	// Print args or defaults.
	if len(args) > 0 {
		fmt.Println(strings.Join(args, " "))
	} else {
		fmt.Println("Swisssh")
		flag.PrintDefaults()
	}
}
