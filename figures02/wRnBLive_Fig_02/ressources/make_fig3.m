function  f3 = make_fig3(P,W,R)

f3 = figure('Position',[100 100 300 300]);
colB = [0 0.447 0.741];
colR = [161 22 50]/256;
hold on; ax = gca; ax.Color = 'none';
plot(log([10.48 10.48]),[-30 -8],':k','linewidth',1.5);
plot(log(W.fr),log(W.pw),'LineWidth',1.35,'color',colB);
plot(log(P.f_k),log(P.Q_k),':k','LineWidth',1.15,'color',colR);
text(log(1.5),-7,['$$\beta^* = $$' sprintf('%4.2f',R.beta)],'Interpreter','latex','FontSize',14)
xlim(log([1 64]))
ax.XTick = log([1 2 4 8 16 32]);
ax.XTickLabel = {'1' '2' '4' '8' '16' '32'};
text(log(10-1),-25,'10.5 Hz','FontSize',12,'HorizontalAlignment','center','Rotation',90);
xlabel('Frequency (Hz)','FontSize',14);
ylabel('Power Spectral Density (dB)','FontSize',14);
end