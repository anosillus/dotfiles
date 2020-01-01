#! /usr/bin/python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
# File name: <+FILE NAME+>
# First Edit: <+DATE+>
# Last Change: 25-Dec-2017.

# import os
# import sys
# from collections import deque, Counter
# import itertools


def inputs(N=0, t=0, s=''):
    '''
    N:inputs    [0(line), 1(lines)]
    t:type      [0(str),  1(int), 2(float)]
    s:separator [(''), (' '), (':')]
    '''

    if not N+t:
        D = input().split(s) if s else input()
    elif not N and t == 1:
        D = map(int, input().split(s)) if s else int(input())
    elif not N:
        D = map(float, input().split(s)) if s else int(input())
    elif not N-1+bool(s):
        num = inputs(t=1)
        D = [inputs(t=t) for i in range(num)]
    else:
        num = inputs(t=1)
        if bool(s):
            D = [inputs(t=t) for i in range(num)]
        else:
            D = [[inputs(t=t, s=s)] for i in range(num)]
    return D


def t_input():
    pass


def test():
    D = t_input()
    print(D)
    pass
    # print(test)


def solve():
    pass
    # print(ans)


if __name__ == '__main__':
    test()
    # solve()
