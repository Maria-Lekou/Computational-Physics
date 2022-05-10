# -*- coding: utf-8 -*-
"""
Created on Mon Mar 21 19:24:07 2022

@author: Μαρία
"""

import numpy as np
from matplotlib import pyplot as plt

N=1000
M=10000

"Aκολουθώ την ίδια διαδικασία με το 1-D"

R2xy=[0 for i in range(10)]
np.random.seed(4400)
for i in range(M):
    r=np.random.random(N)
    x=0
    y=0
    count=0
    for j in range(1,N+1):
        if r[j-1]<0.25:
            x=x+1
        elif 0.25<r[j-1]<0.5:
            x=x-1
        elif 0.5<r[j-1]<0.75:
            y=y+1
        elif 0.75<r[j-1]<1:
            y=y-1
        if j%100==0:
            R2xy[count]+=x**2+y**2
            count+=1
R2xyarray=np.array(R2xy)
Ravxyfinal=R2xyarray/M

"least square"
t=np.linspace(100,1000,10)
tmean=np.mean(t)
ymean=np.mean(Ravxyfinal)
num=0
den=0
for i in range(len(t)):
    num+=(t[i]-tmean)*(Ravxyfinal[i]-ymean)
    den+=(t[i]-tmean)**2
m=num/den
c=ymean-m*tmean
print("η κλίση ευθείας είναι ",m)

Ypred=m*t+c
plt.plot(t,Ravxyfinal)
plt.scatter(t,Ypred)
plt.xlabel("t")
plt.ylabel("$<R^2>$")
    
