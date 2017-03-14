%Plot of u (&v) vs log(1/h) for different values of h: 
x_plot=[log(1) log(2)];
u_plot=[0.403 0.4356]/0.45;
v_plot=[-0.6213 -0.673]/(-0.69375);


subplot(2,1,1)
plot(x_plot,u_plot,'--');
grid on
xlabel('log(1/h)');
ylabel('U_x');
legend('X vs log(1/h)');
title('Plots of X (&Y) vs log(1/h)');


subplot(2,1,2)
plot(x_plot,v_plot,'--');
grid on
xlabel('log(1/h)');
ylabel('U_y');
legend('y vs log(1/h)');

