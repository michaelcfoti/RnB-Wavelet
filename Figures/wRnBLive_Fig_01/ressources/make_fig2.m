function f2 = make_fig2(subpl1,subpl2)

f2 = figure('Position',[100 100 600 300]);
colB = [0 0.447 0.741];

subplot(1,2,1); hold on ; ax = gca; ax.Color = 'none'; 
plot(subpl1.x1,subpl1.y1,'LineWidth',0.8)
plot(subpl1.x2,subpl1.y2,'-r','LineWidth',1.5)
ax.XTick = log([1 2 4 8 16 32 64 128 ]);
ax.XTickLabel = {'1' '2' '4' '8' '16' '32' '64' '128' };
ylim([-20 -10])
xlabel('Hz','FontSize',18); 
ylabel('Power Spectrum Density','FontSize',22);

text(0.1,-12.4,'$Q_i(f)$','Interpreter','latex','FontSize',22,'Color','r')
text(3.04932488689759,-16,'$\Gamma_i(f)$','Interpreter','latex','FontSize',22,'Color',colB)
hold off

subplot(1,2,2); hold on ; ax = gca; ax.Color = 'none';
plot(subpl2.x1,subpl2.y1);
     ax.XTick = log([1 2 4 8 16 32 64 128]);                 %
     ax.XTickLabel = {'1' '2' '4' '8' '16' '32' '64' '128'}; %
     xlabel('Hz','FontSize',18);
     ylim([-20 -10]);
     
fprintf('  Left:  Power spectral density (blue) of the \n')     
fprintf('         above ''pure scale free signal''\n')
fprintf('         Average of the rescaled spectra (red).\n')     
fprintf('  Right: Average power spectrum over 500 epochs.\n') 
     
end