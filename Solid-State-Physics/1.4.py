# -*- coding: utf-8 -*-
"""
Created on Mon Mar 21 22:08:30 2022

@author: Μαρία
"""

import numpy as np
from matplotlib import pyplot as plt

"Ν=1000"
N=1000
M=10000
R2x1=np.zeros(M)
np.random.seed(4400)
for j in range(M):
    r=np.random.random(N)
    x=0
    for i in r:
        if i<0.5:
            x=x+1
        elif 0.5<i<1:
            x=x-1
    R2x1[j]=x
max1=int(max(R2x1))
min1=int(min(R2x1))
num=np.zeros(int(max1-min1))
count=0
for i in range(min1,max1,1):
    for p in R2x1:
        if i<=p<i+1:
            num[count]+=1
    count+=1
xax=np.linspace(min1,max1,max1-min1)
plt.plot(xax,num,alpha=0.7)


"Ν=2000"
N=2000
M=10000
R2x2=np.zeros(M)
np.random.seed(4400)
for j in range(M):
    r=np.random.random(N)
    x=0
    for i in r:
        if i<0.5:
            x=x+1
        elif 0.5<i<1:
            x=x-1
    R2x2[j]=x
max2=int(max(R2x2))
min2=int(min(R2x2))
num=np.zeros(int(max2-min2))
count=0
for i in range(min2,max2,1):
    for p in R2x2:
        if i<=p<i+1:
            num[count]+=1
    count+=1
xax=np.linspace(min2,max2,max2-min2)
plt.plot(xax,num,alpha=0.7)
plt.show()
