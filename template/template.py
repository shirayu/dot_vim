#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import codecs
import contextlib
import sys
import unittest


class BasicTestSuite(unittest.TestCase):
    def setUp(self):
        pass

    def tearDown(self):
        pass

    def test_run(self):
        pass


def operation(inf, outf):
    for line in inf:
        outf.write(line)


@contextlib.contextmanager
def _my_open(filename, mode='r', encoding='utf8'):
    if filename == '-':
        if mode is None or mode == '' or 'r' in mode:
            fh = iter(sys.stdin.readline, "")
        else:
            fh = sys.stdout
    else:
        fh = codecs.open(filename, mode, encoding)
    try:
        yield fh
    finally:
        if filename is not '-':
            fh.close()


def get_opts():
    oparser = argparse.ArgumentParser()
    oparser.add_argument("--input", "-i", default="-", required=False)
    oparser.add_argument("--output", "-o", default="-", required=False)
    return oparser.parse_args()


def main():
    opts = get_opts()
    with _my_open(opts.output, "w", "utf8") as inf:
        with _my_open(opts.output, "w", "utf8") as outf:
            operation(inf, outf)


if __name__ == '__main__':
    main()
