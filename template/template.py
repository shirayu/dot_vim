#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import optparse
import codecs
import sys


def operation(inf, outf):
    for line in inf:
        pass


def main():
    oparser = optparse.OptionParser()
    oparser.add_option("-i", "--input", dest="input", default="-")
    oparser.add_option("-o", "--output", dest="output", default="-")
    oparser.add_option(
        "--verbose", dest="verbose", action="store_true", default=False)
    (opts, args) = oparser.parse_args()

    if opts.input == "-":
        inf = sys.stdin
    else:
        inf = codecs.open(opts.input, "r", "utf8")

    if opts.output == "-":
        outf = sys.stdout
    else:
        outf = codecs.open(opts.output, "w", "utf8")
    operation(inf, outf)


if __name__ == '__main__':
    main()
