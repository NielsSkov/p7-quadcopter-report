clear all
close all
clc

%-----Parameters------------------------------------------
m  = 0.996;            % Mass [kg]
Fg = 9.81 * m;         % Gravity force[N]

Jx = 0.0107;           % Inertia around body x-axis [km·m2]
Jy = 0.0107;           % Inertia around body y-axis [km·m2]
Jz = 0.02135;          % Inertia around body z-axis [km·m2]

L = 0.225;             % Distance between center of the quadcopter and center of each motor [m]
kth = 1.32922e-5;    % Speed of the motor -> thrust force [N·s/rad]
kd =  9.423327e-7;     % Speed of the motor -> drag torque by proppeller [N·m·s/rad]
                   
w1_bar=sqrt(Fg/kth/4); %|<--The equilibrium velocities of the 4 motors [rad/s]
w2_bar=sqrt(Fg/kth/4); %|
w3_bar=sqrt(Fg/kth/4); %|
w4_bar=sqrt(Fg/kth/4); %|
%---------------------------------------------------------

inputDisturbance = 50;

W_bar_sum = (w1_bar + w2_bar + w3_bar + w4_bar)+inputDisturbance*4;
s = tf('s')

num =                          (1/4)*( -2*kth)*W_bar_sum   ;
%       Zdot_I / W_avr_sum  =  --------------------------
den =                                    m*s               ;

G = num/den

p = -200;
C1 = p*G;
C1_closed = C1/(C1+1)

%sisotool(G)

figure(1)
rlocus(C1)
getLinesC1 = get(get(gca, 'Children'), 'Children');
set(getLinesC1{1,1}, 'LineWidth', 1.2)

[stepC1closed, stepC1closedTime] = step(C1_closed);
figure(2)
plot(stepC1closedTime, stepC1closed, 'b', 'linewidth', 1.2)
title('P-controller on Linear System')
xlabel('Time [s]')
ylabel('Velocity [m \cdot s^{-1}]')
grid on, grid minor
axis([ 0 3.5 0 1 ])

