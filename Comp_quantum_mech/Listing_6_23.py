# SU3. py : SU3 matrix manipulations
import numpy as np
from numpy.linalg import *
from IPython.display import display, Latex

"SU3 generators"
L1 = np.array ( [ [ 0 , 1 , 0 ] , [ 1 , 0 , 0 ] , [ 0 , 0 , 0 ] ] ) 
L2 = np.array ( [ [0 , -1j , 0 ] , [ 1j , 0 , 0 ] , [ 0 , 0 , 0 ] ] )
L3 = np.array ( [ [ 1 , 0 , 0 ] , [ 0 , -1 , 0 ] , [ 0 , 0 , 0 ] ] )
L4 = np.array ( [ [ 0 , 0 , 1 ] , [ 0 , 0 , 0 ] , [ 1 , 0 , 0 ] ] )
L5 = np.array ( [ [0 ,0 , -1j ] , [ 0 , 0 , 0 ] , [ 1j , 0 , 0 ] ] )
L6 = np.array ( [ [ 0 , 0 , 0 ] , [ 0 , 0 , 1 ] , [ 0 , 1 , 0 ] ] )
L7 = np.array ( [ [ 0 , 0 , 0 ] , [ 0 , 0 , -1j ] , [ 0 , 1j , 0 ] ] )
L8 = np.array ( [ [ 1 , 0 , 0 ] , [ 0 , 1 , 0 ] , [ 0 , 0 , -2 ] ] ) *1/np.sqrt( 3 )

"Quarks"
u = np.array([1,0,0]) # Up 
d = np.array([0,1,0]) # Down 
s = np.array([0,0,1]) # Strange 

"Raising operators"
Ip = 0.5*(L1+1j*L2) 
Vp = 0.5*(L4+1j*L5)
Up = 0.5*(L6+1j*L7)

"Lowering operators"
Im = 0.5*(L1-1j*L2) 
Vm = 0.5*(L4-1j*L5)
Um = 0.5*(L6-1j*L7)

"If vector is real eliminate the 0 imaginary"
def conv(vector):
    flag=0
    for i in np.imag(vector):
        if i!=0:
            flag=1
    if flag==0:
        vector=np.real(vector)
    return vector


"Actions of operators on the quarks"

Ipxd=np.dot(Ip,d) # Raise d to u
print ("I\u208Ad=", conv(Ipxd),"= u")

Vpxs=np.dot(Vp,s) # Raise s to u
print ("V\u208As=",conv(Vpxs),"= u")

Upxs=np.dot(Up,s) # Raise s to d
print ("U\u208As=",conv(Upxs),"= d")

Imxu=np.dot(Im,u) #Lower u to d
print("I\u208Bu=",conv(Imxu),"= d")

Vmxu=np.dot(Vm,u) #Lower u to s
print("V\u208Bu=",conv(Vmxu),"= s")

Umxd=np.dot(Um,d) #Lower d to s
print("U\u208Bd=",conv(Umxd),"= s")

Ipxu=np.dot(Ip,u) #What happens if I+ to u
print("I\u208Au=",conv(Ipxu))

Upxs=np.dot(Um,s) #What happens if U- to s
print("U\u208Bs=",conv(Upxs))
    
    
