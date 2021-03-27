#!/usr/bin/env python
# -*- coding: utf-8 -*-
# File name: aa.py
# First Edit: 2021-02-18
# Last Change: 2021-02-18

__description__ = ""
__author__ = "@anosillus"
__license__ = "MIT"
__email__ = "anosillus@gmail.com"
__status__ = "Production"

import logging
import itertools
import os
from collections import Counter
from dataclasses import dataclass
from typing import Callable
from typing import Final
from typing import NamedTuple
from typing import TypedDict
from typing import Union
from logzero import logger
import logzero


logzero.logfile("./logfile.log", loglevel=logging.ERROR, backupCount=3)
logzero.loglevel(logging.INFO)

def main():
    logger.debug("hello")



if __name__ == "__main__":
    main()


# vim: ft=python ts=4 sw=4 sts=4 tw=88 fenc=utf-8 ff=unix si et:
