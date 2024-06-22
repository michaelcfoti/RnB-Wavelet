function f2 = make_fig2(Prec,Antc)
colR = [0 0.47 0.74];
colB = [0.74 0 0.47];
f2 = figure('Position',[100 100 1200 420]); 

subplot(1,2,1); hold on; ax=gca; ax.Color = 'none';
    plot(log(Prec.N3.fixed.x),Prec.N3.fixed.y,'-','LineWidth',2.5,'Color',colB);
    plot(log([13.3 13.3]),[0 0.43],':k','linewidth',1.5);   
    plot(log(Prec.N2.x),Prec.N2.y,'-','LineWidth',2.5,'Color',colR);
    ax.XTick = log([1 2 4 8 16 32]);      
    ax.XTickLabel = {'1' '2' '4' '8' '16' '32'}; 
    ax.FontSize = 18;
    plot(log([13.3 13.3]),[0 0.43],':k','linewidth',1.5);
    text(log(1.7),0.50,'NREM3 ( \beta = 1.95)','FontSize',20,'Rotation',0,'HorizontalAlignment','left','Color',colB)
    text(log(1.7),0.45,'NREM2 ( \beta = 1.9)','FontSize',20,'Rotation',0,'HorizontalAlignment','left','Color',colR)
    text(log(6.8),0.31,'6.8 Hz','FontSize',18,'Rotation',0,'HorizontalAlignment','center')
    text('HorizontalAlignment','center','FontSize',18,...
    'String','13.3 Hz',...
    'Position',[log(13.3) 0.57 0]);
    xlabel('Frequency (Hz)','FontSize',20);
    title('PRECUNEUS (FOOOF)','FontSize',18)
    
subplot(1,2,2); hold on; ax=gca; ax.Color = 'none';
    plot(log(Antc.N3.fixed.x),Antc.N3.fixed.y,'-','LineWidth',2.5,'Color',colB);
    ax.XTick = log([1 2 4 8 16 32]);      
    ax.XTickLabel = {'1' '2' '4' '8' '16' '32'};
    text(log(11.5),1.1,'11.5 Hz','FontSize',18,'Rotation',0,'HorizontalAlignment','center')
    text(log(1.7),0.9,'NREM3 ( \beta = 2.1)','FontSize',20,'Rotation',0,'HorizontalAlignment','left','Color',colB)
    text(log(1.7),0.8,'NREM2 ( \beta = 2.0)','FontSize',20,'Rotation',0,'HorizontalAlignment','left','Color',colR)
    plot(log(Antc.N2.x),Antc.N2.y,'-','LineWidth',2.5,'Color',colR);
    ax.XTick = log([1 2 4 8 16 32]);      
    ax.XTickLabel = {'1' '2' '4' '8' '16' '32'};
    ax.FontSize = 18;
    ylim([0 1.2])
    xlabel('Frequency (Hz)','FontSize',20);
    title('ANT. CONGULATE (FOOOF)','FontSize',18)
   
end

