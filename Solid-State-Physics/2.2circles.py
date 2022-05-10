# -*- coding: utf-8 -*-
"""
Created on Thu Mar 31 16:01:48 2022

@author: Μαρία
"""

import numpy as np
import random
from matplotlib import pyplot as plt


N=450
grid=np.zeros((N,N))

grid[int(N/2)][int(N/2)]=1

rsmall=10
b=0
b2=0
np.random.seed(4400)

while True:
    rbig=rsmall+20
    y=np.random.randint(-rsmall,+rsmall+1)
    flag1=0

    r1=np.random.random()
    if r1>0.5:
        x=round(np.sqrt(rsmall**2-y**2))
    elif r1<0.5:
        x=-round(np.sqrt(rsmall**2-y**2))
    y=int(N/2+y)
    x=int(N/2+x)

    while True:
        r2=np.random.random()
        if r2<0.25:
            x+=1
        elif 0.5>r2>0.25:
            x-=1
        elif 0.75>r2>0.5:
            y+=1
        elif 1>r2>0.75:
            y-=1
        if (x-N/2)**2+(y-N/2)**2>rbig**2:
            flag1=1
            break
        if grid[x][y+1]==1 or grid[x][y-1]==1 or grid[x-1][y]==1 or grid[x+1][y]==1:
            grid[x][y]=1
            break
    if flag1==1:
        continue

    r=int(round(np.sqrt((x-N/2)**2+(y-N/2)**2)))
    if r>rsmall:
        rsmall+=10
        
    if rsmall>180:
        break   

"Για την διάσταση του fractal:"
L=np.linspace(10,100,10)
M=np.zeros(10)
Num=20
for n in range(1,Num+1):
    ind=0
    x=int(N/2+np.random.randint(-L[0],L[0]+1))
    y=int(N/2+np.random.randint(-L[0],L[0]+1))
    for t in (L):
        k=int(t/2)
        for i in range(-k,k+1):
            for j in range(-k,k+1):
                if grid[x+i][y+j]==1:
                    M[ind]+=1
        ind+=1

M=M/Num
plt.scatter(np.log10(L),np.log10(M))
plt.xlabel("$log_{10}(L)$")
plt.ylabel("$log_{10}(M)$")
df=(np.log10(M[4])-np.log10(M[0]))/(np.log10(L[4])-np.log10(L[0]))
print("dimension of fractal is ",df)

    
    
