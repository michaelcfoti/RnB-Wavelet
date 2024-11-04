
function f6 = make_fig6(time,s500,Rs500)
f6 = figure('Position',[100 100 700 300]);
hold on; ax = gca; ax.Color = 'none';
plot(time,s500,'-k','LineWidth',0.5)
plot(time,Rs500,'-','Color',[0.8 0 0.4],'LineWidth',1);
xlim([0 20]);
xlabel('time (sec)','FontSize',16);
end