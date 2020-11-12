function [] = plotSimulinkData(data, leg, ref)
%PLOTSIMULINKDATA Summary of this function goes here
%   Detailed explanation goes here

    if ref == 0
        for i=1:max(size(data))
            figure(1)
            plot(data(i).time, data(i).signals(1).values,'LineWidth',3)
            grid on
            hold on

            figure(2)
            plot(data(i).time, data(i).signals(2).values,'LineWidth',3)
            grid on
            hold on

            figure(3)
            plot(data(i).time, data(i).signals(3).values,'LineWidth',3)
            hold on
        end

        figure(1)
        legend(leg);
        title('Activation command')
        xlabel('time [s]')
        ylabel('voltage [V]')
        set(gcf,'color','w')
        grid on

        figure(2)
        legend(leg);
        title('Liquid level height')
        xlabel('time [s]')
        ylabel('height [cm]')
        set(gcf,'color','w')
        grid on

        figure(3)
        legend(leg);
        title('Error')
        xlabel('time [s]')
        ylabel('height [cm]')
        set(gcf,'color','w')
        grid on
    else
        figure(1)
        plot(data(1).time, data(1).signals(1).values,'LineWidth',3)
        legend(leg);
        title('Activation command')
        xlabel('time [s]')
        ylabel('voltage [V]')
        set(gcf,'color','w')
        grid on
        
        figure(2)
        plot(data(1).time, data(1).signals(2).values,'LineWidth',3)
        hold on
        plot(data(2).time, data(2).signals.values, '--')
        legend(leg, 'Reference');
        title('Liquid level height')
        xlabel('time [s]')
        ylabel('height [cm]')
        set(gcf,'color','w')
        grid on
        
        figure(3)
        plot(data(1).time, data(1).signals(3).values,'LineWidth',3)
        legend(leg);
        title('Error')
        xlabel('time [s]')
        ylabel('height [cm]')
        set(gcf,'color','w')
        grid on
    end

end

