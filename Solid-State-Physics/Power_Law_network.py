# -*- coding: utf-8 -*-
"""
Created on Fri May 20 09:16:10 2022

@author: Μαρία
"""
import numpy as np
import matplotlib.pyplot as plt

np.random.seed(4400)

NoS=1000
N=1000 
gama=2.5

def y(x,g):
    ymax=N-1
    ymin=1
    return ((ymax**(1-g) - ymin**(1-g))*x+ymin**(1-g))**(1/(1-g))

def pk(kapa):
    N=len(k)
    d=np.zeros(N)
    for s in range(N):
        d[int(kapa[s])]+=1
    return d

Pk=np.zeros(N)
for i in range(NoS):
    xx=np.random.random(N)
    k=y(xx,gama) #einai swsto?
    k=k.astype(int)
    Pk+=pk(k)

kplot=np.linspace(1,150,150)
logk=np.log10(kplot)
logP=np.log10(Pk)

plt.figure()
plt.scatter(logk,logP[1:151])

klisi=(logP[101]-logP[1])/(logk[100]-logk[0])
print(klisi)

#alliws:
#np.polyfit(logk[0:150],logP[1:151],1)
