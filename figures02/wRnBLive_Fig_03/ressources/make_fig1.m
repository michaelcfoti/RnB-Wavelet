function f1 = make_fig1(Prec,Antc)
colR = [0 0.47 0.74];
colB = [0.74 0 0.47];
f1 = figure('Position',[100 100 1000 420]); 

subplot(1,2,1); hold on; ax=gca; ax.Color = 'none';
    plot(log(Prec.fr2),log(Prec.PR2),'-','LineWidth',2.25,'color',colR);
    plot(log(Prec.fr3),log(Prec.PR3),'-','LineWidth',2.25,'color',colB);
    plot(log([13.4 13.4]),[-6 3.5],':','LineWidth',2,'color','k');
    text(log(13.4),4.5,'13.4 Hz','HorizontalAlignment','Center','FontSize',20)
    ax.XTick = log([1 2 4 8 16 32]);
    ax.FontSize = 18;
    ax.XTickLabel = {'1' '2' '4' '8' '16' '32'};
    xlim(log([0.3 64]));
    ylabel('Power Spectral Density (dB)','FontSize',22) 
    title('PRECUNEUS','FontSize',18)
    text(-0.55,6,'NREM3','FontSize',16,...
    'Color',colB,'HorizontalAlignment','left');
    text(-0.55,3.5,'NREM2','FontSize',16,...
    'Color',colR,'HorizontalAlignment','left');
    xlabel('Frequency (Hz)','FontSize',20);
    hold off
    
subplot(1,2,2); hold on; ax=gca; ax.Color = 'none';
    plot(log(Antc.fr2),log(Antc.PR2),'-','LineWidth',2.2,'color',colR);
    plot(log(Antc.fr3),log(Antc.PR3),'-','LineWidth',2.2,'color',colB);
    plot(log([11.2 11.2]),[-6 3.5],':','LineWidth',2,'color','k');
    text(log(11.2),4.5,'11.2 Hz','HorizontalAlignment','Center','FontSize',20)
    ax.XTick = log([1 2 4 8 16 32]);
    ax.FontSize = 18;
    ax.XTickLabel = {'1' '2' '4' '8' '16' '32'};
    xlim(log([0.3 64]));
    ylabel('Power Spectral Density (dB)','FontSize',22) 
    title('ANT. CINGULATE','FontSize',18)
    text(-0.55,5.5,'NREM3','FontSize',16,...
    'Color',colB,'HorizontalAlignment','left');
    text(-0.55,2.5,'NREM2','FontSize',16,...
    'Color',colR,'HorizontalAlignment','left');
    xlabel('Frequency (Hz)','FontSize',20);
    hold off
    
end

