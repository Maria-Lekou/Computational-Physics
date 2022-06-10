# -*- coding: utf-8 -*-
"""
Created on Tue May 17 22:47:02 2022

@author: Μαρία
"""

import numpy as np
import matplotlib.pylab as plt 

np.random.seed(4400)
N=1000
NoS=20
k=14
p=0.2



def makegrid(N,k):
    grid=np.zeros((N,N))
    for i in range(N):
        grid[np.r_[int(i-k/2):i],i]=1
        grid[np.r_[-N+i+1:-N+int(i+k/2+1)],i]=1
    return grid

def redist(p,grid):
    N=len(grid)
    for i in range(N):
        for j in range(N):
            if grid[i][j]==1:
                r1=np.random.random()
                if r1<=p:
                    l=[t for t in range(N) if grid[i][t]==0]
                    r2=np.random.choice(l)
                    grid[i][j]=0
                    grid[j][i]=0
                    grid[i][r2]=1
                    grid[r2][i]=1
    kapa=np.zeros(N)
    d=np.zeros(N)
    kapa=sum(grid)
    for s in range(N):
        d[int(kapa[s])]+=1
    return grid,d

dfinal=np.zeros(N)


for sim in range(NoS):
    grid=makegrid(N,k)
    [grid,d]=redist(p,grid)
    dfinal+=d
    
dfinal=dfinal/NoS 
kapa=np.linspace(1,30,30) #ayto to eyros mas endiaferei

plt.figure()
plt.scatter(kapa,dfinal[1:31])
plt.xlabel("k")
plt.ylabel("P(k)")
            
