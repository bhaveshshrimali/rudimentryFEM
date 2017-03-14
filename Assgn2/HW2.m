clc;clear all; close all;
syms x L EIo

B1=(L^(-3))*(12*x-6*L);
B2=2*(3*x-2*L)/L^2;
B3=-B1;
B4=(6*x-2*L)/L^2;

EI=EIo*(1+x/L);

K11=int(EI*B1^2,x,0,L);
K11=simplify(K11);
pretty(K11)

K22=int(EI*B2^2,x,0,L);
K22=simplify(K22);
pretty(K22)

K13=int(EI*B3*B1,x,0,L);
K13=simplify(K13);
pretty(K13)

