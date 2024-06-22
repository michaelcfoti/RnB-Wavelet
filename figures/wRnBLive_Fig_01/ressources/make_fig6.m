function f6 = make_fig6(subpl7,subpl8,beta)

f6 = figure('Position',[100 100 600 300]);
colB = [0 0.447 0.741];

    subplot(1,2,2); hold on ; ax = gca; ax.Color = 'none';
    plot(subpl7.x2,subpl7.y2,':k','LineWidth',1.8);

    plot(subpl7.x3,subpl7.y3,'-k','LineWidth',2);
    plot(subpl7.x5,subpl7.y5,':k','LineWidth',1.2);
    text(subpl7.x5(1),2.6,sprintf('%3.2f',beta),'Rotation',0,'FontSize',20,'HorizontalAlignment','center');

    ylim([0 3])
    xlabel('\beta^*','FontSize',22,'FontWeight','bold')
     ylabel('Probability distribution','FontSize',22);
    hold off

subplot(1,2,1); hold on ; ax = gca; ax.Color = 'none';

     plot(subpl8.x2,subpl8.y2,':k','linewidth',1.2);
     plot(subpl8.x3,subpl8.y3,'-','LineWidth',1.55,'Color',colB);
     plot(log([1 64]),[1 1],':k','linewidth',2);
     text(log(10.48-3),5,'10.5 Hz','FontSize',16,'Rotation',90,'HorizontalAlignment','center')
     ax.XTick = log([1 2 4 8 16 32 64]);
     ax.XTickLabel = {'1' '2' '4' '8' '16' '32' '64'};   
     ylim([0.5 7])
     xlabel('Hz','FontSize',22);
     ylabel('Rhythmic factor','FontSize',22);
     

end

