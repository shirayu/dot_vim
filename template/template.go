package main

import (
	"github.com/jessevdk/go-flags"
	"io/ioutil"
	"log"
	"os"
)

type cmdOptions struct {
	Help   bool   `short:"h" long:"help" description:"Show this help message"`
	Input  string `short:"i" long:"input" required:"true"`
	Output string `short:"o" long:"output" required:"true"`
	Log    bool   `long:"log" description:"Enable logging" default:"false"`
}

func operation(opts *cmdOptions) {
}

func main() {
	opts := cmdOptions{}
	optparser := flags.NewParser(&opts, flags.Default)
	optparser.Name = ""
	optparser.Usage = "-i input -o output [OPTIONS]"
	_, err := optparser.Parse()

	//show help
	if len(os.Args) == 1 {
		optparser.WriteHelp(os.Stdout)
		os.Exit(0)
	}
	for _, arg := range os.Args {
		if arg == "-h" {
			os.Exit(0)
		}
	}
	if err != nil {
		os.Exit(1)
	}

	if opts.Log == false {
		log.SetOutput(ioutil.Discard)
	}

	operation(&opts)
}
