function f5 = make_fig5(WR,pW)
% Display of the Wavelet power of the rhythmc epochs.  (and the mean)
f5 = figure('Position',[100 100 600 300]);
colB = [0 0.447 0.741];
hold on; ax = gca; ax.Color = 'none';
plot(log(WR.fr),WR.pw,'LineWidth',2.5,'color',colB);
xlim(log([1 54]))
Y = ylim;
ax.XTick = log([1 2 4 8 16 32]);                 %
ax.XTickLabel = {'1' '2' '4' '8' '16' '32'}; %
text(log(10.5),1.01*Y(2),'10.5 Hz','FontSize',20,'HorizontalAlignment','center');
text(log(1.5),0.7*10^-8,['$$\beta^* = $$' sprintf('%4.2f',pW.beta)],'Interpreter','latex','FontSize',26);
xlabel('Frequency (Hz)','FontSize',22);
ylabel('Rhythmic Power Spectral Density','Interpreter','latex','FontSize',18);
%ylim([0 0.8*10^-8])
end

