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

P = -1;
C1 = P*G;
C1_closed = C1/(C1+1)

%sisotool(G) %--> P = -200

figure(1)
rlocus(G)
getLinesG = get(get(gca, 'Children'), 'Children');
set(getLinesG{1,1}, 'LineWidth', 1.2)
axis([ -2.5 0.5 -1 1 ])
set(gca,'XGrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on')

getText = get(gcf, 'Children');
getText = getText(2);
set(getText,'TickLabelInterpreter', 'latex');

figure(2)
rlocus(C1)
getLinesC1 = get(get(gca, 'Children'), 'Children');
set(getLinesC1{1,1}, 'LineWidth', 1.2)
axis([ -2.5 0.5 -1 1 ])
set(gca,'XGrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on')

getText = get(gcf, 'Children');
getText = getText(2);
set(getText,'TickLabelInterpreter', 'latex');

PI1 = -1/s;

C2 = PI1*G;

figure(3)
rlocus(C2)
getLinesC2 = get(get(gca, 'Children'), 'Children');
set(getLinesC2{1,1}, 'LineWidth', 1.2)
axis([ -2.5 0.5 -1 1 ])
set(gca,'XGrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on')

getText = get(gcf, 'Children');
getText = getText(2);
set(getText,'TickLabelInterpreter', 'latex');

PI2 = -(s+0.8)/s

C3 = PI2*G;

%sisotool(G) %--> PI = -201*(s+0.8)/s

figure(4)
rlocus(C3)
getLinesC3 = get(get(gca, 'Children'), 'Children');
set(getLinesC3{1,1}, 'LineWidth', 1.2)
axis([ -2.5 0.5 -1 1 ])
set(gca,'XGrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on')

getText = get(gcf, 'Children');
getText = getText(2);
set(getText,'TickLabelInterpreter', 'latex');

figure(5)
rlocus(C3)
axis([ -2.5 0.5 -1 1 ])
set(gca,'XGrid','on','YGrid','on','XMinorGrid','on','YMinorGrid','on')

getText = get(gcf, 'Children');
getText = getText(2);
set(getText,'TickLabelInterpreter', 'latex');

hold on
P = 280;
C3_closed= P*PI2*G/(P*PI2*G+1);
rlocus(C3_closed, 1)

getLinesC4 = get(get(gca, 'Children'), 'Children');
getLinesC4_1=getLinesC4{2,1};
getLinesC4_2=getLinesC4{1,1};
set(getLinesC4_1(1), 'LineWidth', 1.2, 'color', '[ 0 .5 0 ]')
set(getLinesC4_1(2), 'LineWidth', 1.2, 'color', '[ 0  0 1 ]')
set(getLinesC4_1(3), 'LineWidth', 1.2, 'color', '[ 0 0.4470 0.7410 ]')
set(getLinesC4_1(4), 'LineWidth', 1.2, 'color', '[ 0 0.4470 0.7410 ]')

set(getLinesC4_2(3), 'LineWidth', 1.2, 'color', '[ 1 0 0 ]')
set(getLinesC4_2(4), 'LineWidth', 1.2, 'color', '[ 0 0.4470 0.7410 ]')

getText = get(gcf, 'Children');
getText = getText(2);
set(getText,'TickLabelInterpreter', 'latex');
%THE PLOT ALREADY USES LATEX INTERPRETATION (SO THIS IS NOT NEEDED)
% textTitle = getText.Title;
% textXlabel = getText.XLabel;
% textYlabel = getText.YLabel;
% set(textTitle,'Interpreter', 'latex');
% set(textXlabel,'Interpreter', 'latex');
% set(textYlabel,'Interpreter', 'latex');




