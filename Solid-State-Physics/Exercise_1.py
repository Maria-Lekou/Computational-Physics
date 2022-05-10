# -*- coding: utf-8 -*-
"""
Created on Mon Mar 14 12:36:12 2022

@author: Μαρία
"""
import numpy as np
import random
from math import log
from matplotlib import pyplot as plt


N = [10,100,1000,10000,100000,1000000]
Nlog=[log(x,10) for x in N]
mv=np.zeros(len(N))
np.random.seed(4400)
ind=0
for i in N:
    n = np.random.random(i)
    mv[ind]=np.mean(n)
    ind+=1

plt.plot(Nlog,mv)
plt.xlabel("log(N)")
plt.ylabel("mean value")
