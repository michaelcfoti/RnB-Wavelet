function  f4 = make_fig4(time,sR1)

f4 = figure('Position',[100 100 700 300]);
hold on ; ax = gca; ax.Color = 'none';

plot(time,sR1,'LineWidth',1.35);
plot([2 2],ylim,':k','LineWidth',1.8);
plot([6 6],ylim,':k','LineWidth',1.8);
xlabel('time (sec)','FontSize',20);
ylabel('Rhythmic Signal','Interpreter','latex','FontSize',20);
hold off
end