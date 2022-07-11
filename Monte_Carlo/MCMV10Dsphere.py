# -*- coding: utf-8 -*-
"""
Created on Wed May 25 23:06:47 2022

@author: Μαρία
"""

import numpy as np

rng=np.random.default_rng()
N=10**6
D=10
V=2**D

coord=rng.random((D,N))

def limofsphere(dim,col,r):
    Sum=0
    Sum=[r[i,col]**2 for i in range(dim)]
    return sum(Sum)

f=[1 if limofsphere(D,i,coord)<=1 else 0 for i in range(N)]

I=(V/N)*sum(f)

print(I)
