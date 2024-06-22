function  f4 = make_fig4(time,subpl4)

f4 = figure('Position',[100 100 700 300]);
hold on ; ax = gca; ax.Color = 'none';
 
    plot(subpl4.x1,subpl4.y1,'LineWidth',1.25); 
    plot(subpl4.x2,subpl4.y2,'-k','LineWidth',1.1);
    xlim([subpl4.x1(1) subpl4.x1(end)])
    xlabel('Seconds','FontSize',18);

    plot(subpl4.x3,subpl4.y3,'--b','LineWidth',1);
    plot(subpl4.x5,subpl4.y5,'--b','LineWidth',1);
    text(4,0.05,'neural mass oscillation','FontSize',22,'Interpreter','latex','Rotation',0,'HorizontalAlignment','center','FontAngle','italic');
    xlim([time(1) time(end)])
    ylim([-0.06 0.08])
    hold off
end