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

P = -200;
C1 = P*G;
C1_closed = C1/(C1+1)

%sisotool(G) %--> P = -200

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

PI1 = -200/s;

C2 = PI1*G;

figure(2)
rlocus(C2)
getLinesC2 = get(get(gca, 'Children'), 'Children');
set(getLinesC2{1,1}, 'LineWidth', 1.2)

PI2 = -201*(s+0.8)/s

C3 = PI2*G;

%sisotool(G) %--> PI = -201*(s+0.8)/s

figure(3)
rlocus(C3)
getLinesC3 = get(get(gca, 'Children'), 'Children');
set(getLinesC3{1,1}, 'LineWidth', 1.2)
axis([ -2.5 0.5 -1 1 ])

C3_closed = C3/(C3+1);

[stepC1closedC3, stepC1closedTimeC3] = step(C3_closed);
figure(4)
plot(stepC1closedTimeC3, stepC1closedC3, 'b', 'linewidth', 1.2)
title('PI-controller on Linear System')
xlabel('Time [s]')
ylabel('Velocity [m \cdot s^{-1}]')
grid on, grid minor
axis([ 0 5 0 1.2 ])





% D =  -200* (s + 3)/s;
% H1 = D*G
% H1_closed = H1/(H1+1)
% 
% Pos = 1/s;
% H_Pos = (H1/(1+H1))*Pos;
% K_Pos = 2;
% H2 = K_Pos*H_Pos
% H2_closed = H2/(H2+1)

%figure(2)
%step(H1_closed)
%figure(3)
%rlocus(H2)
%figure(4)
%step(H2_closed)


