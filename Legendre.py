
import numpy as np 
import matplotlib.pylab as plt
from rk4Algor import rk4Algor

N=20000
x = np.zeros((N-2),float)
Plm = np.zeros((N-2),float)
y =np.zeros(2) #Στον y αποθηκεύουμε τις αρχικές τιμές P, dP/dx
step=0.0001

def normPm0(el,m):
    if m==0:
        if el%2==0:
            y[0]=1 
        elif el%2==1:
            y[0]=-1
    return y[0]

def normPm1(el,m):
    if m>0:
        if el>2 and el%2==0:
            y[0]=1
        elif el>0 and el%2==1:
            y[0]=-1
    return y[0]
    
y[1] = 1
