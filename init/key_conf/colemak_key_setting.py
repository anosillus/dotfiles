#! /usr/local/bin/python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
# File name: test.py
# First Edit: 2019-12-15
# Last Change: 15-Dec-2019.
from __future__ import print_function

d = {
    "q": "q",
    "w": "w",
    "e": "f",
    "r": "p",
    "t": "g",
    "y": "j",
    "u": "l",
    "i": "u",
    "o": "y",
    "p": ";",
    "a": "a",
    "s": "r",
    "d": "s",
    "f": "t",
    "g": "d",
    "h": "h",
    "j": "n",
    "k": "e",
    "l": "i",
    ";": "o",
    "z": "z",
    "x": "x",
    "c": "c",
    "v": "v",
    "b": "b",
    "n": "k",
    "m": "m",
}

# e -> k
# k == n

for outside in d.values():
    a = ""
    base_input = [key for key, value in d.items() if outside == value][0]
    value = [key for key, value in d.items() if base_input == value][0]

    if outside == value:
        a = "pass"
    print(outside + "->" + base_input + "-> " + value + "::" + a)
