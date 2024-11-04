function f5 = make_fig5(subpl5,subpl6)
% Display of the Wavelet power of the rhythmc epochs.  (and the mean)
f5 = figure('Position',[100 100 600 300]);

subplot(1,2,1);hold on ; ax = gca; ax.Color = 'none';
plot(subpl5.x1,subpl5.y1,'LineWidth',0.8)
plot(subpl5.x2,subpl5.y2,'-r','LineWidth',1.25)
ax.XTick = log([1 2 4 8 16 32 64 128 ]);
ax.XTickLabel = {'1' '2' '4' '8' '16' '32' '64' '128' }; 
xlabel('Hz','FontSize',18);
ylim([-20 -10])
ylabel('Power Spectrum Density','FontSize',22);
hold off


subplot(1,2,2); hold on ; ax = gca; ax.Color = 'none';
plot(subpl6.x1,subpl6.y1,'LineWidth',1.15);
ax.XTick = log([1 2 4 8 16 32 64 128 ]);
ax.XTickLabel = {'1' '2' '4' '8' '16' '32' '64' '128' };
text(log(10.3),-13.5,'10.5 Hz','FontSize',16,'HorizontalAlignment','left');
xlabel('Hz','FontSize',18);
ylim([-20 -10])
hold off

fprintf('  Left: power spectral density (blue) of the \n')     
fprintf('        above ''composite signal''\n')
fprintf('        Average of the rescaled spectra (red).\n')     
fprintf('  Right: Average power spectrum over 300 epochs.\n') 
fprintf('         The peak corresponds to the neural mass\n')
fprintf('         component.\n')
end

