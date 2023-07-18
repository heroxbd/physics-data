#!/usr/bin/env python3
import numpy as np

gamma0 = np.diag((1, 1, -1, -1))
dirac = np.array([
    gamma0,
    gamma0[:, ::-1],
    np.diag((-1j, 1j, 1j, -1j))[::-1],
    np.diag((1, -1, -1, 1))[:, (2, 3, 0, 1)]
])

eta = np.diag([1, -1, -1, -1]) # 复习狭义相对论

def acommute(a, b):
    '''
    反对易子
    '''
    ab = np.einsum('ilm,jmn->ijln', a, b)
    ab_T = np.transpose(ab, (1, 0, 2, 3))
    return ab + ab_T

assert np.all(acommute(dirac, dirac) == 2 * np.einsum('ij,kl->ijkl', eta, np.eye(4)))

gamma5 = 1j * dirac[0] @ dirac[1] @ dirac[2] @ dirac[3]

assert np.all(gamma5.T == gamma5)
assert np.all(gamma5 @ gamma5 == np.eye(4))
assert np.all(0 == np.einsum('ij, ajk -> aik', gamma5, dirac) +
              np.einsum('aij, jk -> aik', dirac, gamma5))
dirac_sub = np.einsum('ab, bij -> aij', eta, dirac)
assert np.all(np.einsum('aij, bjk, ckl, alm -> bcim', dirac, dirac, dirac, dirac_sub) == 
              4 * np.einsum('ij, kl -> ijkl', eta, np.eye(4)))
