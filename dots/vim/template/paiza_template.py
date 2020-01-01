#! /usr/bin/python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
# File name: <+FILE NAME+>
# First Edit: <+DATE+>
# Last Change: 14-Sep-2017.

'''
question
'<+CURSOR+>'
data

ans

'''


# from __future__ import print_function
# import os
# import sys
# from collections import deque, Counter
# import itertools


def input_l(N=1, type=0, str=' '):
    data = []
    for i in range(N):
        if type == 0:
            data.extend(list(map(int, input().split(str))))
        elif type == 1:
            data.extend(input().split(str))
        elif type == 2:
            data.extend([list(map(int, input().split(str)))])
        elif type == 3:
            data.append(input().split(str))
    return data


N = []
data = []

'''
raw_data = input_l()
N = int(raw_data[0])
print(N)
data = input_l(N, 3)
print(data)
'''


ans = []
print(ans)

'''
 if __name__ == "__main__":
    execute only if run as a script
    main()
'''
