#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
"""
__author__ = 'Yuta Hayashibe' 
__version__ = ""
__copyright__ = ""
__license__ = "GPL v3"


import codecs
import sys
# sys.stdin  = codecs.getreader('UTF-8')(sys.stdin)
# sys.stdout = codecs.getwriter('UTF-8')(sys.stdout)




import optparse
import sys
def main():
    oparser = optparse.OptionParser()
#     oparser.add_option("-i", "--input", dest="input")
    (opts, args) = oparser.parse_args()

    for line in iter(sys.stdin.readline, ""):
        pass

if __name__=='__main__':
    pass

