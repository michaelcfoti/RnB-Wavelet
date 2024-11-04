function  f4 = make_fig4(Wpow,J,fs)

f4 = figure('Position',[100 100 500 420]);
Js = {'12' '11' '10' '9' '8' '7' '6' '5' '4' '3' '2' '1'};
Jf = {}; for i=0:1:11, Jf{12-i}=sprintf('%4.2f-%4.2fHz',fs/2^(i+2),fs/2^(i+1)); end
% 4. Display of D_j's (Wavelet power)
subplot(2,3,[1 2 3 4 5 6]); hold on; ax = gca; ax.Color = 'none';
mWavPow = mean(Wpow,1);
plot(Wpow',':','LineWidth',1.2,'Color',[0.7 0.7 0.7 0.7])
plot(mWavPow,'.k','MarkerSize',28)
plot(mWavPow,'-k','LineWidth',2)
xlim([0.5 J+0.5])

ax.XTick = 1:J;
ax.XTickLabel = Js(12-J+1:end);
ax.FontSize = 14;
xlabel('scale ( j )')
ylabel('log-Wavelet-Power ( D_j )')
text(3,10,'slope \beta^*','FontSize',22);
pause(0.1)
end