#!/usr/bin/env python3
# -*- coding: utf-8 -*-
'''
Stub
'''

import argparse
import codecs
import sys


def operation(inf, outf):
    '''
    Stub
    '''
    for line in inf:
        outf.write(line)


def main():
    '''
    Parse arguments
    '''
    oparser = argparse.ArgumentParser()
    oparser.add_argument("-i", "--input", dest="input", default="-")
    oparser.add_argument("-o", "--output", dest="output", default="-")
    oparser.add_argument(
        "--verbose", dest="verbose", action="store_true", default=False)
    opts = oparser.parse_args()

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
