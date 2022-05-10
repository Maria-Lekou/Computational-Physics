# -*- coding: utf-8 -*-
"""
Created on Wed Mar 30 15:47:54 2022

@author: Μαρία
"""
import numpy as np


"1-D"
N=10000 # number of runs
M=1000 #number of steps
R2x=np.zeros(N) 
np.random.seed(4400)
for j in range(N):
    r=np.random.random(M)
    x=0
    for i in r:
        "random 1-D walk"
        if i<0.5:
            x=x+1
        else:
            x=x-1
    R2x[j]=x**2
R2xav=np.mean(R2x)
print("1-D: <R2>=",R2xav)
