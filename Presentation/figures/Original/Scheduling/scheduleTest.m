clear all; close all; clc

for i = 1:2
   if i == 1
       data = csvread('PRINT_00.csv',2,0);
   else
       data = csvread('PRINT_03.csv',2,0);
   end
   
   t = data(:,1)-data(1,1);
   control = data(:,2);
   com = data(:,3);

   figure;
   plot(t, control+5.8)
   hold on
   plot(t, com)
   
   grid on, grid minor
   set(gca,'ytick',[])
   set(gca,'yticklabel',[])
   ylim([ -3 12 ])
   
   if i == 1
       title('Schedule Test, First Design','interpreter','latex')
   else
       title('Schedule Test, Final Design','interpreter','latex')
   end
   
   l=legend('Control task', 'Communication task', 'location', 'southeast');
   set(l,'Interpreter','Latex');
   xlabel('Time [s]','interpreter','latex')
end