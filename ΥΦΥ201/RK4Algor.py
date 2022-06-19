import numpy as np
def rk4Algor (t,h,N,y,f):
    k1=np.zeros(N)
    k2=np.zeros(N)  
    k3=np.zeros(N)  
    k4=np.zeros(N)
    k1 = h*f(t,y)
    k2 = h*f(t+h/2.,y+k1/2.)
    k3 = h*f(t+h/2.,y+k2/2.)
    k4 = h*f(t+h,y+k3)
    y = y+(k1+ 2*(k2+k3)+k4)/6.
    return y
