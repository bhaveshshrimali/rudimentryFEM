close all; clc; clear all; 

syms x y xc eta xe1 xe2 xe3 ye1 ye2 ye3 real

%(i)
%Defining the values of Shape Functions at nodal points
val_matrix=eye(3);
subs_matrix=[1 0 0; 0 1 0; 1 1 1];
%Determining the coefficients associated with the coordinates
inverse=val_matrix/subs_matrix;
vec=[xc;eta;1];
%Constructing the linear shape functions
for i=1:1:3
    N(i)=inverse(i,:)*vec;
end

%Calculation of local derivatives
L_xc=diff(N,xc);
L_eta=diff(N,eta);

vec=[xc;eta];

%(ii)
x=N*[xe1;xe1;xe3];
y=N*[ye1;ye1;ye3];

X=[x;y];

Je=[xe1-xe3 ye1-ye3; xe2-xe3 ye2-ye3];

for i=1:3
    dN_dX{i}=inv(Je)*[diff(N(i),vec(1));diff(N(i),vec(2))];
    dN_dX{i}=simplify(dN_dX{i});
    B(1,i)=(dN_dX{i}(1,1));
    B(2,i)=(dN_dX{i}(2,1));
end
B=simplify(B);

