clear all
close all

run Parameters.m

step_x=0;
step_y=0;
step_z=1;

run StateSpace.m

%----------------- Translational Velocity controller ----------------------
s=tf('s');
C_xdot=-0.1;
C_ydot=0.1;
C_zdot=-0.5*(0.2*s+1)/(0.13*s+1);

C_x=0.8;
C_y=0.8;
C_z=0.9;
%--------------------------------------------------------------------------

sim('TotalControllerSim.slx')

figure(1)
plot(simoutZvelStepNonLinear.time, simoutZvelStepNonLinear.signals.values, 'b', 'linewidth', 1.2)
title('P-controller and Input Disturbance on Nonlinear System')
xlabel('Time [s]')
ylabel('Velocity [m \cdot s^{-1}]')
grid on, grid minor
axis([ 0 3.5 0 1 ])