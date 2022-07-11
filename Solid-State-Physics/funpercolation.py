# -*- coding: utf-8 -*-
"""
Created on Fri May  6 19:46:21 2022

@author: Μαρία
"""

import numpy as np
from matplotlib import pyplot as plt


np.random.seed(4400)

def percolation():
    N=200
    N2=N*N
    prob=np.array([0.1,0.2,0.3,0.4,0.5,0.55,0.56,0.57,0.58,0.59,0.6,0.61,0.62,0.63,0.64,0.65,0.7,0.8,0.9])
    plen=len(prob)
    iav=np.zeros(plen)
    iavt=np.zeros(plen)
    pmax=np.zeros(plen)
    countprob=0
    for p in prob:
        r=np.random.random((N,N))
        grid=np.full((N,N),5)

        k=0

        for i in range(len(r[1])):
            for j in range(len(r[1])):
                if r[i][j]>p:
                    grid[i][j]=0
                else:
                    grid[i][j]=1
        flag=0   
        L=np.ones(50*N,int)
        S=np.zeros(50*N,int)

        #pN^2:
        sum1=sum(sum(grid))
            
        index=0
        #Για πρώτη στήλη:
        for i in range(N):
            if grid[i][0]==1:
                if grid[i-1][0]==0:
                    index+=1
                    L[index]=index
                    S[index]+=1
                    grid[i][0]=index
                else:
                    S[index]+=1
                    grid[i][0]=index
        k=index
        #Για το υπόλοιπο grid
        for j in range(1,N):
            for i in range(0,N):
                if grid[i][j]==0:
                    continue
                else:
                    if grid[i][j-1]==0:
                        if grid[i-1][j]==0 or i==0:
                            k+=1
                            L[k]=k
                            grid[i][j]=L[k]
                            S[L[k]]=S[L[k]]+1
                            continue
                        else:
                            index=grid[i-1][j]
                            grid[i][j]=L[index]
                            S[L[index]]=S[L[index]]+1
                            continue
                    else:
                        index=grid[i][j-1]
                        grid[i][j]=L[index]
                        S[L[index]]=S[L[index]]+1
                        if grid[i-1][j]==0 or grid[i-1][j]==grid[i][j-1] or i==0:
                            continue
                        else:
                            L[grid[i-1][j]]=L[index]
                            S[index]=S[index]+S[grid[i-1][j]]
                            S[grid[i-1][j]]=0
                            for li in range(len(L)):
                                if L[li]==grid[i-1][j]:
                                    L[li]=grid[i][j-1]
                         

        L[0]=0
        grid=L[grid]

        pmax[countprob]=max(S)/(sum1)
        
        sortS=np.sort(S)
        iav[countprob]=0
        iavt[countprob]=0
        for i in range(len(S)):
            if sortS[i]!=0:
                iav[countprob]+=(sortS[i]/sum1)*sortS[i]
                
            if i<len(S)-1:
                iavt[countprob]=iav[countprob]
        

        countprob+=1

    #Κρίσιμο σημείο:
    pc=prob[iavt.argmax()]


    
    
    return iav,iavt,pmax,prob,pc


