clc;
clear all;close all;
%Mapping of Node # and {x,y} values:
Node=1:9;
Node_Coord=[1 -1 -1
            2 1 -1
            3 1 1
            4 -1 1
            5 0 -1
            6 1 0 
            7 0 1
            8 -1 0
            9 0 0];
for i=1:9
    xlist=[]
    N(i)=interpolate()
%Definition of Lagrange polynomial:
