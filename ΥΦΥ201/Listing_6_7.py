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

""""
Η f είναι πίνακας που μέσω αυτής θα υπολογίζουμε
το δεξί μέλος του συστήματος σε κάθε βήμα.
Το πρώτο στοιχείο είναι το dP/dx=y[1] και το δεύτερο 
d^2/dx^2=f()
"""


"Υπολογισμός Plm από runge-Kutta στο x=xi, (-1,1)"

 
for m in range(0,2):
    plt.figure()
    for l in range(m,5):
        i = -1
        if m==0:
            y[0]=normPm0(l,m)
        if m==1:
            y[0]=normPm1(l,m)
        el=l
        def f(xi,yi):
            rhs=np.zeros(2) # Declare array dimension
            rhs[0]=yi[1]
            rhs[1]=2*xi*yi[1]/(1-xi**2)-(el*(el+1)-
                    m**2/(1-xi**2))*yi[0]/(1-xi**2)
            return rhs
        for xi in np.arange (-1+step , 1-step , step ):
            i=i+1 
            x[i]=xi
            """
            N=2 γιατί έχουμε σύστημα οπότε είναι σαν να
            καλούμε την RK 2 φορές
            """
            y=rk4Algor(xi,step,2,y,f) 
            Plm[i]=y[0]
        if max(abs(Plm))>1:
            Plm=Plm/max(abs(Plm))
        plt.plot(x,Plm,label=r'$l=$'+str(l))
        #plt.ylim([-1,1.1])
        plt.grid(True)
        plt.title(r'Legendre Polynomials, $P_l^%i(x)$'%m)
        plt.xlabel('x')
        plt.ylabel('$\mathbf{P_l^m(x)}$')
        plt.legend(loc='best')
    plt.show()
