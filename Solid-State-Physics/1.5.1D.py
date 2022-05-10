# -*- coding: utf-8 -*-
"""
Created on Mon Mar 21 19:56:51 2022

@author: Μαρία
"""

import numpy as np
from matplotlib import pyplot as plt

"1-D"
N=1000
M=10000
s=np.zeros(10)
np.random.seed(4400)
for j in range(M):
    r=np.random.random(N)
    x=500
    S=np.zeros(N)
    S[x]=1
    count=0
    for i in range(1,N+1):
        if r[i-1]<0.5:
            x+=1
        elif r[i-1]>0.5:
            x-=1
        if S[x]==0:
            S[x]=1
        if (i)%100==0:
            s[count]+=sum(S)
            count+=1

smean=s/M
print(smean)
t=np.linspace(100,1000,10)
Stheor=((8*t)/np.pi)**(1/2)

plt.plot(t,Stheor)
plt.scatter(t,smean)
plt.xlabel("t")
plt.ylabel("<S>")
plt.show()