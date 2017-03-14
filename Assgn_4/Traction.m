clc;
%Calculation of the nodal forces for Problem#2

%Since we know that the shape function varies linearly between two
%nodes we can directly carry out the integrals.

syms y 
f=15*y;
% 1) Using Mesh 1
N=[1-y y];
f_nodal=int(N'*f,y,0,1);

% 2) Using Mesh 2
N12=y*2;N11=2*(0.5-y);
N21=2*(1-y);N22=2*(y-0.5);

N1=[N11 N12];
N2=[N21 N22];

f1_nodal=int(N1'*f,y,0,0.5);
f2_nodal=int(N2'*f,y,0.5,1);


