#!/usr/bin/env python3

import argparse
import codecs
import contextlib
import gzip
import io
import sys
import typing
import unittest


class BasicTestSuite(unittest.TestCase):
    def setUp(self):
        pass

    def tearDown(self):
        pass

    def test_run(self):
        pass


def operation(path_in: str, path_out: str) -> None:
    with smart_open(path_in, "r", "utf8") as inf,\
            smart_open(path_out, "w", "utf8") as outf:
        for line in inf:
            outf.write(line)


@contextlib.contextmanager
def smart_open(filename: str, mode: str = 'r', encoding: str = 'utf8',
               iterator: bool = False, errors: str = 'backslashreplace') \
        -> typing.Iterator[typing.IO[str]]:
    fh: typing.Any = None
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
        if not iterator and filename != '-':
            fh.close()


def get_opts() -> argparse.Namespace:
    oparser = argparse.ArgumentParser()
    oparser.add_argument("--input", "-i", default="-", required=False)
    oparser.add_argument("--output", "-o", default="-", required=False)
    return oparser.parse_args()


def main() -> None:
    opts = get_opts()
    operation(opts.input, opts.output)


if __name__ == '__main__':
    main()
