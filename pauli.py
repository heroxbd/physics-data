#!/usr/bin/env python3
'''
Pauli 矩阵
'''
import numpy as np

pauli = np.array([
    np.array([0, 1, 1, 0]).reshape(2,2),
    np.array([0, -1j, 1j, 0]).reshape(2,2),
    np.diag((1, -1))
])

def commute(a, b):
    '''
    张量版的对易子
    '''
    ab = np.einsum('ilm,jmn->ijln', a, b)
    # ab_T = np.einsum('ilm,jmn->jiln', a, b)
    ab_T = np.transpose(ab, (1,0,2,3))
    return ab - ab_T
    
from asym import eps
eps3 = eps(3)

assert np.all(commute(pauli, pauli) == 2j * np.tensordot(eps3, pauli, axes=(2, 0))) # 'ijk,klm -> ijlm'
              
