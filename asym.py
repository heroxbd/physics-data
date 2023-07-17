#!/usr/bin/env python3

import itertools as it

# p3 课堂练习：构造 n 阶全反称张量
# n = 1, 1
#
# n = 2, \epsilon_{00} = \epsilon_{11} = 0
# \epsilon_{01} = 1, \epsilon_{10} = -1

# eps2 = np.zeros((2, 2))
# eps2[0, 1] = 1
# eps2[1, 0] = -1
#
# n = 3
# \epsilon_{ijk} 当 ijk 是 012 的偶排列取 1, 当 ijk 是奇排列时取 -1，其它取 0
#
# eps3 = np.zeros((3, 3, 3))
# eps3[0, 1, 2] = eps3[1, 2, 0] = eps3[2, 0, 1] = 1
# eps3[1, 0, 2] = eps3[2, 1, 0] = eps3[0, 2, 1] = -1

def parity(p):
    n = len(p)
    # TODO: 假设了 combinations 结果是有序的
    pairs = sum([p[i] > p[j]
                 for i, j in it.combinations(range(n), 2)])
    return -1 if pairs % 2 else 1

def eps(n=5):
    '''
    返回 n 阶全反称张量。
    '''
    rst = np.zeros((n,) * n)
    for p in it.permutations(range(n)):
        rst[p] = parity(p)
    return rst
