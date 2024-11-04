function f4 = make_fig4(Prec,Antc)
colB = [0 0.47 0.74];
f4 = figure('Position',[100 100 1000 320]);

subplot(1,2,1); hold on ; ax = gca; ax.Color = 'none';
plot(Prec.Fast.Mix.Gmix.x,Prec.Fast.Mix.Gmix.y,'-','LineWidth',2,'color',colB);
xlim(log([0.3 64]));
plot(Prec.Slow.Mix.Gmix.x,Prec.Slow.Mix.Gmix.y,'-','LineWidth',2,'color','k');

plot(log([5 9]),[0.1 0.1],'-','LineWidth',6,'Color',[0.4 0.4 0.4]);
text(mean(log([5 9])),0.15,'\theta','FontSize',16,'HorizontalAlignment','Center')
plot(log([11.7 14.7]),[0.1 0.1],'-','LineWidth',6,'Color',[0.4 0.4 0.4]);
plot(log([0.5 4]),[0.1 0.1],'-','LineWidth',6,'Color',[0.4 0.4 0.4]);
text(mean(log([0.5 4])),0.15,'\delta','FontSize',16,'HorizontalAlignment','Center')
text(mean(log([11.7 14.7])),0.15,'\sigma','FontSize',16,'HorizontalAlignment','Center')
text(log(1.55),0.39,'1.55 Hz','FontSize',12,'HorizontalAlignment','center');
text(log(7.03),0.48,'7.03 Hz','FontSize',12,'HorizontalAlignment','center');
text(log(3.7),0.4,'3.70 Hz','FontSize',12,'HorizontalAlignment','center');
text(log(13.4),0.66,'13.4 Hz','FontSize',12,'HorizontalAlignment','center');
plot([1.62 1.62],[0 0.36],':','LineWidth',1.7,'Color',[0.4 0.4 0.4]);
text(1.47,0.2,'5 Hz','Rotation',90,'FontSize',12,'HorizontalAlignment','center')
ax.XTick = log([1 2 4 8 16 32]);             %
ax.XTickLabel = {'1' '2' '4' '8' '16' '32'}; %
xlim(log([0.3 64]));
xlabel('Frequency (Hz)','FontSize',16)
text(log(0.4),0.58,'Slow Switchers','FontSize',16)
text(log(0.4),0.52,'Fast Switchers','FontSize',16,'Color',colB)
ylabel('Rhythmic Power Spectral Density','FontSize',14)
title('PRECUNEUS','FontSize',18)
hold off

subplot(1,2,2); hold on ; ax = gca; ax.Color = 'none';
plot(Antc.Fast.Mix.Gmix.x,Antc.Fast.Mix.Gmix.y,'-','LineWidth',2,'color',colB);
xlim(log([0.3 64]));
plot(Antc.Slow.Mix.Gmix.x,Antc.Slow.Mix.Gmix.y,'-','LineWidth',2,'color','k');
ax.XTick = log([1 2 4 8 16 32]);             %
ax.XTickLabel = {'1' '2' '4' '8' '16' '32'}; %
text(0.5*log(2),0.31,'0.5-4 Hz ( \delta )','FontSize',14,'HorizontalAlignment','center');
text(0.5*log(2),0.36,'**','FontSize',22,'HorizontalAlignment','center');
plot(log([8 14]),[0.72 0.72],'-','LineWidth',6,'Color',[0.4 0.4 0.4]);
plot(log([0.5 4]),[0.19 0.19],'-','LineWidth',6,'Color',[0.4 0.4 0.4]);
text(mean(log([8 14])),0.84,'8-14 Hz ( \sigma )','FontSize',14,'HorizontalAlignment','center');
text(mean(log([8 14])),0.91,'*','FontSize',22,'HorizontalAlignment','center')
plot([1.62 1.62],[0 0.6],':','LineWidth',1.7,'Color',[0.4 0.4 0.4]);
text(1.47,0.4,'5 Hz','Rotation',90,'FontSize',12)
text(log(4),1.43,'Slow Switchers','FontSize',16)
text(log(4),1.28,'Fast Switchers','FontSize',16,'Color',colB)
ylabel('Rhythmic Power Spectral Density','FontSize',14)
xlabel('Frequency (Hz)','FontSize',16)
title('ANT. CINCULATE','FontSize',18)
hold off
    
end



