# -*- coding: utf-8 -*-
"""
Created on Sat Jun 11 13:05:55 2022

@author: Μαρία
"""

import numpy as np
import matplotlib.pyplot as plt 
from funpercolation import percolation 

iav=[0]*15
iavt=[0]*15
pmax=[0]*15
pc=[0]*15

for i in range(15):
    [iav[i],iavt[i],pmax[i],prob,pc[i]]=percolation()

iav=np.array((iav))
iavt=np.array((iavt))
pmax=np.array((pmax))
prob=np.array(prob)

iav=np.mean(iav,0)
iavt=np.mean(iavt,0)
pmax=np.mean(pmax,0)
pct=np.mean(pc)
pct=round(pct, 2)


logIav=np.log10(iav)
logIavt=np.log10(iavt)
logpmax=np.log10(pmax)
logpmpc=np.log10(abs(prob-pct))

gama=np.polyfit(logpmpc[7:10],logIav[7:10],1)
beta=np.polyfit(logpmpc[12:16],logpmax[12:16],1)


plt.figure()
plt.scatter(prob,pmax)
plt.title('Figure 1')
plt.ylabel('pmax')
plt.xlabel('p')
plt.show()

plt.figure()
plt.scatter(prob,iav)
plt.title('Figure 2')
plt.ylabel('Iav')
plt.xlabel('p')

plt.figure()
plt.scatter(prob,iavt)
plt.title('Figure 3')
plt.ylabel('Iavt')
plt.xlabel('p')


