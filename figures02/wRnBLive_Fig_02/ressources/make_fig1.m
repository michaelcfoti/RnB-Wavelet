function f1 = make_fig1(time,data,W0)

f1 = figure('position',[100 100 800 320]);
hold on ; ax = gca; ax.Color = 'none'; 
colB = [0 0.47 0.74];
% signal
subplot(1,5,[1 2 3]);
hold on; ax = gca; ax.Color='none';
plot(time,data,'LineWidth',1.35);
xlabel('time (sec)','FontSize',18);
% spectre
subplot(1,5,[4 5]);
hold on; ax = gca; ax.Color='none';
plot(log([10.48 10.48]),[0 1.9]*10^-8,':k','linewidth',2);
plot(log(W0.fr),W0.pw,'LineWidth',2,'color',colB);
ax.XTick = log([1 2 4 8 16 32]);
ax.XTickLabel = {'1' '2' '4' '8' '16' '32'};
Y = ylim;
text(log(10.5),1.01*Y(2),'10.5 Hz','FontSize',18,'HorizontalAlignment','center');
xlabel('Hz','FontSize',18);
ylabel('Rhythmic Power Spectral Density','Interpreter','latex','FontSize',18)
hold off

end

