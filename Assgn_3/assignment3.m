clc; clear all; close all;
syms xc eta xe1 xe2 xe3 ye1 ye2 ye3 real

%-------------------------------------------------------------------------%
%Variable Definitions: 
%E- Young's Modulus in pressure units
%v- Poisson's Ratio
% %N1- Shape Function 1
% N2- Shape Function 2
% N3- Shape Function 2
% J- Jacobian Matrix
% dNdX- Differentiation of Shape Function Matrix wrt x and y
% A, B, C- Entities required for D Matrix
% xe- x coordinate of node
% ye- y coordinate of node
% xc- local x coordinate
% eta- local y coordinate
% x- global x coordinate
% y-global y coordinate
%-------------------------------------------------------------------------%

E=100;
v=0.25;

N1=xc;
N2=eta;
N3=1-xc-eta;

N=[N1 N2 N3];

dex=[xe1 xe2 xe3];
dey=[ye1 ye2 ye3];

x=N*dex';y=N*dey';
J=[diff(x,xc) diff(y,xc); diff(x,eta) diff(y,eta)]
detJ=det(J)
dNdx=zeros(2,1);
for i=1:3
    dNdX(:,i)=J\[diff(N(i),xc);diff(N(i),eta)];
end
for i=1:3
    B{i}=[dNdX(1,i) 0;0 dNdX(2,i);dNdX(2,i) dNdX(1,i)];
end

%Here det(J)*Be is displayed for compact notation
Be=horzcat(B{1},B{2},B{3});
detJ*Be

A=E*(1-v)/((1+v)*(1-2*v));
B=E*v/((1+v)*(1-2*v));
G=E/(2*(1+v));

D_pstrain=[A B 0; B A 0; 0 0 G];
D_pstress=E/(1-v^2)*[1 v 0; v 1 0; 0 0 0.5*(1-v)];

xe1=4;
ye1=0;
xe2=0;
ye2=3;
xe3=0;
ye3=0;

Ke_pstrain=6*transpose(Be)*D_pstrain*Be;
Ke_pstress=6*transpose(Be)*D_pstress*Be;

Ke_pstrain=double(subs(Ke_pstrain))
Ke_pstress=double(subs(Ke_pstress))



