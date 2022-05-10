# -*- coding: utf-8 -*-
"""
Created on Mon Mar 21 15:28:56 2022

@author: Μαρία
"""
import numpy as np
from matplotlib import pyplot as plt

N=1000
M=10000

R2x=[0 for i in range(10)]
np.random.seed(4400)
""""
Σε κάθε run αννανεώνω τις τιμές του R2x
δηλαδή βρίσκω στο τέλος το άθροισμα από τα Μ runs και για
να βρω τη μέση τιμή στο τέλος διαιρώ απλά με Μ
"""
for i in range(M):
    r=np.random.random(N)
    x=0
    count=0
    for j in range(1,N+1):
        if r[j-1]<0.5:
            x=x+1
        elif r[j-1]>0.5:
            x=x-1
        if j%100==0:
            R2x[count]+=x**2
            count+=1
R2xarray=np.array(R2x)
Ravxfinal=R2xarray/M

"least square"
t=np.linspace(100,1000,10)
tmean=np.mean(t)
ymean=np.mean(Ravxfinal)
num=0
den=0
for i in range(len(t)):
    num+=(t[i]-tmean)*(Ravxfinal[i]-ymean)
    den+=(t[i]-tmean)**2
m=num/den
c=ymean-m*tmean
print("η κλίση ευθείας είναι ",m)

Ypred=m*t+c
plt.plot(t,Ravxfinal)
plt.scatter(t,Ypred)
plt.xlabel("t")
plt.ylabel("$<R^2>$")
    
