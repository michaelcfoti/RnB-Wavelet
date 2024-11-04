function f3 = make_fig3(Prec,Antc)
colR = [0 0.47 0.74];
colB = [0.74 0 0.47];
f3 = figure('Position',[100 100 1200 420]);

subplot(1,2,1); hold on ; ax = gca; ax.Color = 'none';

    bmN2 = mean(Prec.N2.figu4.betas);
    bmN3 = mean(Prec.N3.figu4.betas);

    plot(Prec.beta_samp,Prec.gN2,'-k','LineWidth',2,'Color',colB);
    plot(Prec.N2.figu4.exp.q,Prec.N2.figu4.exp.p,'.','MarkerSize',8,'Color',colB);  
    plot(Prec.beta_samp,Prec.gN3,'-k','LineWidth',2,'Color',colR);
    plot(Prec.N3.figu4.exp.q,Prec.N3.figu4.exp.p,'.','MarkerSize',8,'LineWidth',1.8);
    ax.FontSize = 18;
    xlabel('\beta^*','FontSize',22);
    plot([2 2],[0 1],':k','linewidth',1.1);
    ylim([0 1.1])
    text(0.22,1,'NREM2','FontSize',18,'Rotation',0,'HorizontalAlignment','left','Color',colR)
    text(0.22,0.92,'NREM3','FontSize',18,'Rotation',0,'HorizontalAlignment','left','Color',colB)
    text(3,1,sprintf('(mean = %3.2f)',bmN2),'Interpreter','latex','FontSize',18,'Rotation',0,'HorizontalAlignment','left','Color',colR)
    text(3,0.92,sprintf('(mean = %3.2f)',bmN3),'Interpreter','latex','FontSize',18,'Rotation',0,'HorizontalAlignment','left','Color',colB)
    title('PRECUNEUS','FontSize',18)
    ylabel('Probability density','FontSize',18)
    hold off

subplot(1,2,2); hold on ; ax = gca; ax.Color = 'none';

    bmN2 = mean(Antc.N2.figu4.betas);
    bmN3 = mean(Antc.N3.figu4.betas);
    
    plot(Antc.beta_samp,Antc.gN2,'-k','LineWidth',2,'Color',colB);
    plot(Antc.N2.figu4.exp.q,Antc.N2.figu4.exp.p,'.','MarkerSize',8,'Color',colB);
    plot(Antc.beta_samp,Antc.gN3,'-k','LineWidth',2,'Color',colR);
    plot(Antc.N3.figu4.exp.q,Antc.N3.figu4.exp.p,'.','MarkerSize',8,'LineWidth',1.8);
    ax.FontSize = 18;
    xlabel('\beta^*','FontSize',22);
    plot([2 2],[0 0.7],':k','linewidth',1.1);
    ylim([0 1.5])
    text(0.22,1.26,'NREM2','FontSize',18,'Rotation',0,'HorizontalAlignment','left','Color',colR)
    text(0.22,1.15,'NREM3','FontSize',18,'Rotation',0,'HorizontalAlignment','left','Color',colB)
    text(3.1,1.26,sprintf('(mean = %3.2f)',bmN2),'Interpreter','latex','FontSize',18,'Rotation',0,'HorizontalAlignment','left','Color',colR)
    text(3.1,1.15,sprintf('(mean = %3.2f)',bmN3),'Interpreter','latex','FontSize',18,'Rotation',0,'HorizontalAlignment','left','Color',colB)
    title('ANT. CINCULATE','FontSize',18)
    ylabel('Probability density','FontSize',18)
    hold off
    
end



