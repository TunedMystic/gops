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

var args []string
var help bool
var version bool

func init() {
	flag.BoolVar(&help, "help", false, "Show help")
	flag.BoolVar(&version, "version", false, "Show version information")
	flag.Parse()
}

func printInfo() {
	fmt.Printf("Gops - GOlang Project Sample\n\n")
	fmt.Printf("Usage: gops [arg]\n\n")
	fmt.Printf("Flags:\n")
	flag.PrintDefaults()
}

func main() {
	args = flag.Args()

	// Print Help
	if help == true {
		printInfo()
		os.Exit(0)
	}

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
		printInfo()
	}
}
