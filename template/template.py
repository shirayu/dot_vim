#!/usr/bin/env python3

import argparse
import codecs
import contextlib
import gzip
import io
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
def _my_open(filename, mode='r', encoding='utf8',
             iterator=False, errors='backslashreplace'):
    if filename == '-':
        if mode is None or mode == '' or 'r' in mode:
            if iterator:
                fh = iter(sys.stdin.readline, "")
            else:
                fh = io.TextIOWrapper(sys.stdin.buffer,
                                      encoding=encoding, errors=errors)
        else:
            fh = io.TextIOWrapper(sys.stdout.buffer,
                                  encoding=encoding, errors=errors)
    elif filename.endswith('.gz'):
        fh = gzip.open(filename, mode=mode + 't', encoding=encoding)
    else:
        fh = codecs.open(filename, mode, encoding, errors=errors)
    try:
        yield fh
    finally:
        if filename != '-':
            fh.close()


def get_opts():
    oparser = argparse.ArgumentParser()
    oparser.add_argument("--input", "-i", default="-", required=False)
    oparser.add_argument("--output", "-o", default="-", required=False)
    return oparser.parse_args()


def main():
    opts = get_opts()
    with _my_open(opts.input, "r", "utf8") as inf,\
            _my_open(opts.output, "w", "utf8") as outf:
        operation(inf, outf)


if __name__ == '__main__':
    main()
