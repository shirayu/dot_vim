package main

import (
	"io/ioutil"
	"log"
	"os"

	"github.com/jessevdk/go-flags"
)

type cmdOptions struct {
	Help   bool   `short:"h" long:"help" description:"Show this help message"`
	Input  string `short:"i" long:"input" required:"true"`
	Output string `short:"o" long:"output" required:"true"`
	Log    bool   `long:"log" description:"Enable logging" default:"false"`
}

func operation(opts *cmdOptions) error {
	return nil
}

func main() {
	opts := cmdOptions{}
	optparser := flags.NewParser(&opts, flags.Default)
	optparser.Name = ""
	optparser.Usage = "-i input -o output [OPTIONS]"
	_, err := optparser.Parse()

	//show help
	if err != nil {
		for _, arg := range os.Args {
			if arg == "-h" || arg == "--help" {
				os.Exit(0)
			}
		}
		os.Exit(1)
	}

	if opts.Log == false {
		log.SetOutput(ioutil.Discard)
	}

	if err := operation(&opts); err != nil {
		log.Fatal(err)
	}

}
