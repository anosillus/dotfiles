#!/usr/bin/env python
# -*- coding: utf-8 -*-
# File name: <+FILE NAME+>
# First Edit: <+DATE+>
# Last Change: <%= strftime('%Y-%m-%d') %>

__author__ = "@iida"
__description__ = ""
__status__ = "Production"
__email__ = "kenji.iida@maas.co.jp"

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
    <+CURSOR+>


if __name__ == "__main__":
    main()


# vim:tw=88 ff=unix ft=python ts=4 sw=4 sts=4 si et:
