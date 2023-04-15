#!/usr/bin/env python
# -*- coding: utf-8 -*-
# File name: aa.py
# First Edit: 2022-10-20
# Last Change: 2022-10-20

from os import listdir, system
from os.path import isfile, join


mypath = '/home/anosillus/git/github.com/anosillus/dotfiles/'
homepath = '/home/anosillus/'

files = [f for f in listdir(mypath) if f not in ['memo', 'config', '.git', 'aa.py']]

for i in files:
    system(f"rm -fr {homepath+'.'+i}")
    system(f"ln -s {mypath+i} {homepath+'.' + i}")

mypath = mypath+'config/'
files = [f for f in listdir(mypath) if f not in ['coc']]
homepath = homepath +'.config/'

for i in files:
    system(f"rm -fr {homepath+i}")
    system(f"echo ln {mypath+i} {homepath+i}")

    system(f"ln -s {mypath+i} {homepath+i}")



# vim: ft=python ts=4 sw=4 sts=4 tw=88 fenc=utf-8 ff=unix si et:
