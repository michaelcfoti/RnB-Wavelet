function f7 = make_fig7(B300,fr300,P300)
f7 = figure('Position',[100 100 800 300]);
hold on; ax = gca; ax.Color = 'none';

    subplot(1,2,1); hold on; ax =gca; ax.Color= 'none';
    [a,b]=hist(B300,60);
    p = a/sum(a)/(b(2)-b(1));
    plot(b,p,'.','Color',[0.8 0.8 0.8]);
    plot(b,smooth(p),'-k','LineWidth',1.75);
    plot([2 2],[0 1.2],':k','LineWidth',2)
    ax.FontSize = 16; 
    xlabel('$\beta^*$','Interpreter','latex','FontSize',18)

    subplot(1,2,2); hold on; ax =gca; ax.Color= 'none';
    plot(log(fr300),smooth(sqrt(500)*P300),'-k','LineWidth',2) 
    ax.XTick = log([1 2 4 8 16 32]);
    ax.XTickLabel = {'1' '2' '4' '8' '16' '32'};
    ax.FontSize = 14;
    ylim([0 12])
    xlim(log([0.5 40]))
    xlabel('frequency (Hz)','FontSize',14);
    text(log(0.65),12,'Rhythmic Power Spectral Density','FontSize',16,'HorizontalAlignment','left');

end