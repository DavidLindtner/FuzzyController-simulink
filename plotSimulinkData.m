function [] = plotSimulinkData(data)
%PLOTSIMULINKDATA Summary of this function goes here
%   Detailed explanation goes here

figure(1)
plot(data.time, data.signals(1).values,'LineWidth',3)
title('Activation command')
set(gcf,'color','w')
grid on

figure(2)
plot(data.time, data.signals(2).values,'LineWidth',3)
title('Water level height')
set(gcf,'color','w')
grid on

figure(3)
plot(data.time, data.signals(3).values,'LineWidth',3)
title('Error')
set(gcf,'color','w')
grid on

end

