# -*- coding: utf-8 -*-
"""
Created on Wed Mar 30 15:47:54 2022

@author: Μαρία
"""
import numpy as np


"2-D"
N=10000 # number of runs
M=1000 #number of steps
R2xy=np.zeros(N) 
np.random.seed(4400)
for j in range(N):
    r=np.random.random(M)
    x=0
    y=0
    for i in r:
        "random 2-D walk"
        if i<0.25:
            x=x+1
        elif 0.25<i<0.5:
            x=x-1
        elif 0.5<i<0.75:
            y=y+1
        elif 0.75<i<1:
            y=y-1
    R2xy[j]=x**2+y**2
R2xyav=np.mean(R2xy)
print("2-D: <R2>=",R2xyav)
