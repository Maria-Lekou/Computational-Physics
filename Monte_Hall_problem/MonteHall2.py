# -*- coding: utf-8 -*-
"""
Created on Wed Mar 23 14:06:59 2022

@author: Μαρία
"""

import random


"Stratigiki 2"

N=10000
P1=1
P2=2
P3=0

win=0
for i in range(N):
    r1=random.random()
    if r1<1/3:
        choice=P1
    elif 1/3<r1<2/3:
        choice=P2
    elif r1>2/3:
        choice=P3
    r2=random.random()
    if choice==P1:
        if r2<0.5:
            open=P2
        elif r2>0.5:
            open=P3
    elif choice==P2:
        open=P3
    elif choice==P3:
        open=P2
    if choice==P1 and open==P2:
        choice=P3
    elif choice==P1 and open==P3:
        choice=P2
    elif (choice==P2 and open==P3) or (choice==P3 and open==P2):
        choice=P1
    if choice==1:
        win+=1

Prob=win/N
print("times of win:", win)
print("Probability of win:", Prob)