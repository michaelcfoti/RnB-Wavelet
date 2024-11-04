function f5 = make_fig5(Wpow,J,fs)
% Display of the Wavelet power of the rhythmc epochs.  (and the mean)
f5 = figure('Position',[100 100 500 420]); hold on; ax = gca; ax.Color = 'none';
Jf = {}; for i=0:1:11, Jf{12-i}=sprintf('%4.2f-%4.2fHz',fs/2^(i+2),fs/2^(i+1)); end;
mWavPowR = mean(Wpow,1);
plot(mWavPowR,'.k','MarkerSize',28)
plot(mWavPowR,'-k','LineWidth',3)
plot(Wpow',':','LineWidth',1.2,'Color',[0.3 0.3 0.3 0.3])
xlim([0.5 J+0.5])
ylim([0 0.25]*10^6)
ax.XTick = 1:J;
ax.XTickLabel = Jf(12-J+1:end);
u = 0.1e5;
for j = 1:J
    text(j,mWavPowR(j)+u,sprintf('scale j = %d',J-j+1), ...
        'HorizontalAlignment','left', ...
        'Rotation',90,'FontSize',14); 
end
ax.FontSize = 14;
ylabel('Wavelet Power')
end

