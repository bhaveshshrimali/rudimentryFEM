clear all; close all; clc;

%Modified Newton-Raphson Method
%In the present problem we do not consider unloading part of the force

%Given Parameters: 
%state_a: Binary flag to represent the state of the left segment of the rod. It
%assumes a value of 0 for elastic state and 1 for inelastic state. 

%state_b: Binary flag to represent the state of the left segment of the rod. It
%assumes a value of 0 for elastic state and 1 for inelastic state. 

%num_step: Number of steps in the Newton Raphson 

%Number of steps in which the load needs to be applied: 2

%varepsilon: Tolerance parameter for error 

%F_ext: External Load as applicable for the step

%F_int: Internal Load as applicable for the step (and iteration)

disp ('%-------------------------------------------------------------------------%')
disp ('%                       CEE570 - Finite Element Method                    %')
disp ('%                                  Spring 2016                            %')
disp ('%                      Submitted By: BHAVESH SHRIMALI%                     ')
disp ('%-------------------------------------------------------------------------%')


La=10; Lb=5; L=La+Lb;
F_ext=[2e4;4e4];
epsilon_y=0.002;
E=1e7;A=1;d=0;
E_t=1e5;sigma_y=2e4;
varepsilon=1e-12; 
state_a=0;state_b=0;
F_int=0;

for i=1:length(F_ext)
    Fe=F_ext(i);
    iter_count=0;
    res_o=Fe-F_int;
    res=Fe-F_int;
  
    %Check if the left portion of the bar is elastic
    if state_a==0
        Ka=E*A/La;
    else
        Ka=E_t*A/La;
    end
    
    %Check if the right portion of the bar is elastic
    if state_b==0
        Kb=E*A/Lb;
    else
        Kb=E_t*A/Lb;
    end
    K=Ka+Kb;
    while(abs(res)>varepsilon*abs(res_o))
        iter_count=iter_count+1;
        del_d=res/K;
        d=d+del_d;
        d_arr(iter_count,i)=d;
        epsilon_a=d/La;
        epsilon_b=d/Lb;
        if epsilon_a<=epsilon_y
            Fa_int=E*epsilon_a*A;
            state_a=0;
        else
            Fa_int=(E_t*(epsilon_a-epsilon_y)+sigma_y)*A;
            state_a=1;
        end
        
        if epsilon_b<=epsilon_y
            Fb_int=E*epsilon_b*A;
            state_b=0;
        else
            Fb_int=(E_t*(epsilon_b-epsilon_y)+sigma_y)*A;
            state_b=1;
        end
        if iter_count==1
            res_o=Fe-(Fa_int+Fb_int);
        end
        F_int=Fa_int+Fb_int;
        res=Fe-F_int;
        Residual(iter_count,i)=res;
    end
    iterations(i)=iter_count;
    displacement(i)=d;
end

u_n=vertcat(0,[max(d_arr(:,1));max(d_arr(:,2))]);
Fext=vertcat(0,F_ext);
Res_store=Residual(:,2);
d_final=horzcat(d_arr(:,2),Res_store);
plot(u_n,Fext);
grid on;
xlabel('Displacement(cm)');ylabel('Force(N)');
title('Force-Displacement for Modified Newton Method');
legend('F vs u_n');
       
    