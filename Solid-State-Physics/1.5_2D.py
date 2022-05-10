# -*- coding: utf-8 -*-
"""
Created on Tue Mar 22 12:04:37 2022

@author: Μαρία
"""

import numpy as np
from matplotlib import pyplot as plt

"2-D"
N=1000
M=10000
s=np.zeros(10)
np.random.seed(4400)
for j in range(M):
    r=np.random.random(N)
    x=500
    y=500
    S=np.zeros((N,N))
    S[x][y]=1
    count1=0
    count2=0
    for i in range(1,N+1):
        if r[i-1]<0.25:
            x+=1
        elif 0.5>r[i-1]>0.25:
            x-=1
        elif 0.75>r[i-1]>0.5:
            y+=1
        elif 1>r[i-1]>0.75:
            y-=1
        if S[x][y]==0:
            S[x][y]=1 
            count2+=1
        if i%100==0:
            s[count1]+=count2
            count1+=1
smean=s/M
print(smean)
t=np.linspace(100,1000,10)
Stheor=np.pi*t/np.log(8*t)

plt.plot(t,Stheor)
plt.scatter(t,smean)
plt.xlabel("t")
plt.ylabel("<S>")
plt.show()
