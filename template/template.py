#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import codecs
import sys


def operation(inf, outf):
    for line in inf:
        outf.write(line)


def get_opts():
    oparser = argparse.ArgumentParser()
    oparser.add_argument("--input", "-i", default="-", required=False)
    oparser.add_argument("--output", "-o", default="-", required=False)
    return oparser.parse_args()


def main():
    opts = get_opts()
    if opts.input == "-":
        inf = iter(sys.stdin.readline, "")
    else:
        inf = codecs.open(opts.input, "r", "utf8")

    if opts.output == "-":
        outf = sys.stdout
    else:
        outf = codecs.open(opts.output, "w", "utf8")
    operation(inf, outf)


if __name__ == '__main__':
    main()
