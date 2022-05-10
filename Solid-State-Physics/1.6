# -*- coding: utf-8 -*-
"""
Created on Tue Mar 29 20:56:54 2022

@author: Μαρία
"""

import numpy as np
import random
from matplotlib import pyplot as plt
import math

M=100000
N=500 
c1=0.01
c2=0.001 

traps1=int(c1*N**2)
traps2=int(c2*N**2)


"For c1-------------------------------------------"

grid=np.zeros((N,N))

np.random.seed(4400)

for i in range(traps1):
    r1=np.random.randint(0,N-1)
    r2=np.random.randint(0,N-1)
    grid[r1][r2]=-1


t=np.zeros(M)
for i in range(M):
    while True:
        x=np.random.randint(0,N-1)
        y=np.random.randint(0,N-1)
        if grid[x][y]==0:
            break
        
    while grid[x][y]==0:
        r=np.random.random()
        if r<0.25:
            x+=1
        elif 0.25<r<0.5:
            x-=1
        elif 0.5<r<0.75:
            y+=1
        elif 0.75<r<1:
            y-=1
        if x>=500:
            x=x-1
        if x<0:
            x=x+1
        if y>=500:
            y=y-1
        if y<0:
            y=y+1
        t[i]+=1
    
plt.hist(t,bins=1000)
plt.show()

Nsteps=np.linspace(1,max(t),100)

"How many survived after N steps"
list1=np.zeros(100)
count=0
for i in Nsteps:
  for j in t:  
      if j>i:
          list1[count]+=1
  count+=1

Ppeir1=list1/M

Ptheor1=(1-c1)**(np.pi*Nsteps/np.log(8*Nsteps))

plt.scatter(Nsteps,Ppeir1,label='Exp')
plt.plot(Nsteps,Ptheor1,color='green')
plt.xlabel("t")
plt.ylabel("Φ(t)")

plt.show()


"For c2-------------------------------------------"

grid=np.zeros((N,N))

np.random.seed(4400)

for i in range(traps2):
    r1=np.random.randint(0,N-1)
    r2=np.random.randint(0,N-1)
    grid[r1][r2]=-1


t=np.zeros(M)
for i in range(M):
    while True:
        x=np.random.randint(0,N-1)
        y=np.random.randint(0,N-1)
        if grid[x][y]==0:
            break
        
    while grid[x][y]==0:
        r=np.random.random()
        if r<0.25:
            x+=1
        elif 0.25<r<0.5:
            x-=1
        elif 0.5<r<0.75:
            y+=1
        elif 0.75<r<1:
            y-=1
        if x>=500:
            x=x-1
        if x<0:
            x=x+1
        if y>=500:
            y=y-1
        if y<0:
            y=y+1
        t[i]+=1
    
plt.hist(t,bins=1000)
plt.show()

Nsteps=np.linspace(1,max(t),100)

"How many survived after N steps"
list1=np.zeros(100)
count=0
for i in Nsteps:
  for j in t:  
      if j>i:
          list1[count]+=1
  count+=1

Ppeir2=list1/M

Ptheor2=(1-c2)**(np.pi*Nsteps/np.log(8*Nsteps))

plt.scatter(Nsteps,Ppeir2,label='Exp')
plt.plot(Nsteps,Ptheor2,color='green')
plt.xlabel("t")
plt.ylabel("Φ(t)")

plt.show()
