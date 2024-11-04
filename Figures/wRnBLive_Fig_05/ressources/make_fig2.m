function f2 = make_fig2(Prec,Antc)
colR = [161 22 50]/256;
colG = [0.4 0.4 0.4];
f2 = figure('Position',[100 100 1000 320]); 

subplot(1,2,1); hold on; ax=gca; ax.Color = 'none';
    plot(Prec.SSWk_free.bb,Prec.SSWk_free.db,':','LineWidth',2.5,'color',[0 0 0]);
    plot(Prec.with_SSWk.bb,Prec.with_SSWk.db,'-','LineWidth',3,'color',colR);
    plot([2 2],[0 1.45],'--k','LineWidth',1.25,'Color',colG);
    ax.FontSize = 14;
    xlim([0.5 3.2])
    ylabel('Probability Density','FontSize',14)
    text(2.5, 1.4,'(baseline)','FontSize',16,'HorizontalAlignment','left','Color',[0 0 0])
    text(1.25,0.1,'antipersistence','FontSize',14,'HorizontalAlignment','center','FontAngle','italic')
    text(2.6,0.1,'persistence','FontSize',14,'HorizontalAlignment','center','FontAngle','italic')
    xlabel('$\beta^*$','Interpreter','latex','FontSize',22)
    title('PRECUNEUS','FontSize',18)
    
subplot(1,2,2); hold on; ax=gca; ax.Color = 'none';
    plot(Antc.SSWk_free.bb,Antc.SSWk_free.db,':','LineWidth',2.5,'color',[0 0 0]);
    plot(Antc.with_SSWk.bb,Antc.with_SSWk.db,'-','LineWidth',3,'color',colR);
    plot([2 2],[0 1.45],'--k','LineWidth',1.25,'Color',colG)
    xlim([0.5 3.2])
    ax.FontSize = 14;
    ylabel('Probability Density','FontSize',14)
    text(3.01,1.4,'(baseline)','FontSize',16,'HorizontalAlignment','center','Color',[0 0 0])
    text(1.25,0.1,'antipersistence','FontSize',14,'HorizontalAlignment','center','FontAngle','italic')
    text(2.6,0.1,'persistence','FontSize',14,'HorizontalAlignment','center','FontAngle','italic')
    xlabel('$\beta^*$','Interpreter','latex','FontSize',22)
    title('ANT. CONGULATE','FontSize',18)
   
end

