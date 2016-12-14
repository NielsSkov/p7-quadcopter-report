%% Back to equilibrium
load attitudeAcceptTestStick

font=13;
figure
plot(0:0.015:30,Ang(1,692:2692),'Color',[0 0.5 0], 'Linewidth',1.2)
hold on
plot(0:0.015:30,Ang(2,692:2692),'Color',[0 0 0.5], 'Linewidth',1.2)
plot(0:0.015:30,Ang(3,692:2692)-0.05,'Color',[0.5 0 0], 'Linewidth',1.2)
xlim([0,18])
xlabel('Time [s]','FontSize',font)
ylabel('Angle [rad]','FontSize',font)
title('Stabilization of the Attitude around Equilibrium','FontSize',font)
h = legend('Roll','Pitch', 'Yaw','Location','SouthEast');
set(h,'FontSize',font-2);
grid on
grid minor

%% Reference in roll - All angles
load rollRefeAcceptTestStick
font=13;
t=[0 2.5 2.5 25];
step_roll=[-0.51 -0.51 0.2 0.2];
figure
plot(0:0.015:25.5,Ang(1,192:1892),'Color',[0 0 0.5], 'Linewidth',1.2)
hold on
plot(t,step_roll,'Color',[0.5 0 0],'LineStyle','--', 'Linewidth',1.2)
plot(0:0.015:25.5,Ang(2,192:1892),'Color',[0 0.5 0], 'Linewidth',1.2)
plot(0:0.015:25.5,Ang(3,192:1892)-0.05,'Color',[0.5 0 0], 'Linewidth',1.2)

xlim([0,18])
xlabel('Time [s]','FontSize',font,'Interpreter','Latex')
ylabel('Angle [rad]','FontSize',font,'Interpreter','Latex')
title('Reference Tracking in Roll','FontSize',font,'Interpreter','Latex')
h = legend('Roll', 'Reference in Roll','Pitch', 'Yaw','Location','SouthEast');
set(h,'FontSize',font-2);
grid on
grid minor


%% Reference in pitch
load pitchRefeAcceptTestStick
font=13;
t=[0 3.85 3.85 25];
step_pitch=[-0.69 -0.69 0.2 0.2];
figure
plot(0:0.015:25.5,Ang(2,192:1892),'Color',[0 0 0.5], 'Linewidth',1.2)
hold on
plot(t,step_pitch,'Color',[0.5 0 0],'LineStyle','--', 'Linewidth',1.2)
plot(0:0.015:25.5,Ang(1,192:1892),'Color',[0 0.5 0], 'Linewidth',1.2)
hold on
plot(0:0.015:25.5,Ang(3,192:1892)-0.05,'Color',[0.5 0 0], 'Linewidth',1.2)

xlim([0,18])
xlabel('Time [s]','FontSize',font,'Interpreter','Latex')
ylabel('Angle [rad]','FontSize',font,'Interpreter','Latex')
title('Reference Tracking in Pitch','FontSize',font,'Interpreter','Latex')
h = legend('Pitch', 'Reference in Pitch','Roll', 'Yaw','Location','SouthEast');
set(h,'FontSize',font-2);
grid on
grid minor