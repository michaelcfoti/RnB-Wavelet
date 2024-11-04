function f3 = make_fig3(Prec,Antc)
colR = [161 22 50]/256;
colG = [0.4 0.4 0.4];
f3 = figure('Position',[100 100 1000 320]);

subplot(1,2,1); hold on ; ax = gca; ax.Color = 'none';

    plot(log(Prec.SSWk_free.WR.fr),Prec.SSWk_free.PR,':','LineWidth',2.5,'color',[0 0 0]);
    plot(log(Prec.with_SSWk.WR.fr),Prec.with_SSWk.PR,'-','LineWidth',3,  'color',colR);
    xlim(log([0.3 32]));
    ax.XTick = log([1 2 4 8 16 32]);             %
    ax.XTickLabel = {'1' '2' '4' '8' '16' '32'}; %
    ax.FontSize = 14;
    % bar:
    plot([log(6) log(9)],[0.08 0.08],'-','color',colG,'LineWidth',5)
    text(mean([log(6) log(9)]),0.15,'\theta','FontSize',18,'HorizontalAlignment','Center')
    plot([log(12) log(14)],[0.08 0.08],'-','color',colG,'LineWidth',5)
    text(mean([log(12) log(14)]),0.15,'\sigma','FontSize',18,'HorizontalAlignment','Center')
    ylim([0 1.1])
    text(log(6),0.86, '(baseline)','HorizontalAlignment','center','FontSize',16,'Color',[0 0 0]);
    xlabel('Frequency (Hz)','FontSize',16);
    ylabel('Rhythmic Power Spectral Density','FontSize',14)
    title('PRECUNEUS','FontSize',18)
    hold off

subplot(1,2,2); hold on ; ax = gca; ax.Color = 'none';

    plot(log(Antc.SSWk_free.WR.fr),Antc.SSWk_free.PR,':','LineWidth',2.5,'color',[0 0 0]);
    plot(log(Antc.with_SSWk.WR.fr),Antc.with_SSWk.PR,'-','LineWidth',3,'color',colR);
    xlim(log([0.3 32]));
    % bar:
    plot([log(6) log(14)],[0.08 0.08],'-','color',colG,'LineWidth',5)
    text(mean([log(6) log(14)]),0.15,'\theta-\sigma','FontSize',18,'HorizontalAlignment','Center')
    ylim([0 1.1])
    ax.XTick = log([1 2 4 8 16 32]);             %
    ax.XTickLabel = {'1' '2' '4' '8' '16' '32'}; %
    xlabel('Frequency (Hz)','FontSize',14);
    text(log(14),0.7,'(baseline)','FontSize',16,'HorizontalAlignment','right','Color',[0 0 0])
    ax.FontSize = 14;
    ylabel('Rhythmic Power Spectral Density','FontSize',14)
    title('ANT. CINCULATE','FontSize',18)
    hold off
    
end



