# -*- coding: utf-8 -*-
"""
Created on Wed Mar 23 14:17:28 2022

@author: Μαρία
"""

import random

N=10000
P1=1
P2=2
P3=0

win=0
for i in range(N):
    choice=P1
    r2=random.random()
    if r2<0.5:
        open=P2
    elif r2>0.5:
        open=P3
    if  open==P3:
        choice=P2
    if choice==1:
        win+=1

Prob=win/N
print("times of win:", win)
print("Probability of win:", Prob)