function f2 = make_fig2(time,data,exponent)

f2 = figure('Position',[100 100 600 300]);
hold on; ax = gca; ax.Color='none';
plot(time,data,'LineWidth',1.35);
plot([2 2],ylim,':k','LineWidth',1.8);
plot([6 6],ylim,':k','LineWidth',1.8);
text(0.2,0.012,['$$\beta = $$' sprintf('%4.2f',exponent)],'Interpreter','latex','FontSize',20)
text(4,-0.005,'neural mass oscillation','Interpreter','latex','FontSize',20,'HorizontalAlignment','center')
ylabel('Signal','Interpreter','latex','FontSize',20);
xlabel('time (sec)','FontSize',18)
hold off
     
end