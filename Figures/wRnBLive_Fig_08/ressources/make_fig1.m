function f1 = make_fig1(Prec,Antc)

f1 = figure('Position',[100 100 900 320]); 

colR = [161 22 50]/256;
colG = [0.6 0.6 0.6];
colB = [0 0.47 0.74];
u =  0.01;
v = -0.01;
subplot(1,2,2); hold on; ax=gca; ax.Color = 'none';

        plot(1+u,Antc.Rhy_N2.Ms,'.','MarkerSize',30,'color',colR); text(1+3*u,Antc.Rhy_N2.Ms,'N2')
        errorbar(1+u,Antc.Rhy_N2.Ms,Antc.Rhy_N2.Es,'-','LineWidth',1.5,'color',colR);
        plot(1.2+u,Antc.Rhy_N2.Mf,'.','MarkerSize',30,'color',colB); text(1.2+3*u,Antc.Rhy_N2.Mf,'N2')
        errorbar(1.2+u,Antc.Rhy_N2.Mf,Antc.Rhy_N2.Ef,'-','LineWidth',1.5,'color',colB);

        plot(1+u,Antc.Raw_N2.Ms,'.','MarkerSize',10,'color',colR); text(1+3*u,Antc.Raw_N2.Ms,'N2')
        errorbar(1+u,Antc.Raw_N2.Ms,Antc.Raw_N2.Es,'-','LineWidth',1.5,'color',colR);
        plot(1.2+u,Antc.Raw_N2.Mf,'.','MarkerSize',10,'color',colB); text(1.2+3*u,Antc.Raw_N2.Mf,'N2')
        errorbar(1.2+u,Antc.Raw_N2.Mf,Antc.Raw_N2.Ef,'-','LineWidth',1.5,'color',colB);
        
        plot(1+v,Antc.Rhy_N3.Ms,'.k','MarkerSize',30,'color',colR); text(1+5*v,Antc.Rhy_N3.Ms,'N3')
        errorbar(1+v,Antc.Rhy_N3.Ms,Antc.Rhy_N3.Es,'-k','LineWidth',1.5,'color',colR);
        plot(1.2+v,Antc.Rhy_N3.Mf,'.k','MarkerSize',30,'color',colB);  text(1.2+5*v,Antc.Rhy_N3.Mf,'N3')
        errorbar(1.2+v,Antc.Rhy_N3.Mf,Antc.Rhy_N3.Ef,'-k','LineWidth',1.5,'color',colB);
        text(1.1,0.28,'( Rhythmic )','Rotation',0,'FontSize',14,'HorizontalAlignment','center','FontWeight','bold')

        plot(1+v,Antc.Raw_N3.Ms,'.','MarkerSize',10,'color',colR); text(1+5*v,Antc.Raw_N3.Ms,'N3')
        errorbar(1+v,Antc.Raw_N3.Ms,Antc.Raw_N3.Es,'-','LineWidth',1.5,'color',colR);
        plot(1.2+v,Antc.Raw_N3.Mf,'.','MarkerSize',10,'color',colB); text(1.2+5*v,Antc.Raw_N3.Mf,'N3')
        errorbar(1.2+v,Antc.Raw_N3.Mf,Antc.Raw_N3.Ef,'-','LineWidth',1.5,'color',colB);
        text(1.1,0.2,'( Raw )','Rotation',0,'FontSize',14,'HorizontalAlignment','center')
        ylim([0.17 0.32])
        xlim([.9 1.3])
        ax.XTick = [1 1.2];
        lab1 = sprintf('Slow Switchers');
        ax.XTickLabel = {lab1 'Fast Switchers'};
        ax.FontSize = 16;
        ylabel('PAC delta-sigma')  
        plot([.9 1.23],[0.3 0.3],':k')
        plot([.9 1.23],[0.25 0.25],':k')
        
        title('ANT. CINGULATE')

    subplot(1,2,1); hold on; ax=gca; ax.Color = 'none';

    u = 0.01;
    v = -0.01;
        plot(1+u,Prec.Rhy_N2.Ms,'.','MarkerSize',30,'color',colR); text(1+3*u,Prec.Rhy_N2.Ms,'N2')
        errorbar(1+u,Prec.Rhy_N2.Ms,Prec.Rhy_N2.Es,'-k','LineWidth',1.5,'color',colR);
        plot(1.2+u,Prec.Rhy_N2.Mf,'.','MarkerSize',30,'color',colB); text(1.2+3*u,Prec.Rhy_N2.Mf,'N2')
        errorbar(1.2+u,Prec.Rhy_N2.Mf,Prec.Rhy_N2.Ef,'-k','LineWidth',1.5,'color',colB);
        
        plot(1+u,Prec.Raw_N2.Ms,'.','MarkerSize',10,'color',colR); text(1+3*u,Prec.Raw_N2.Ms,'N2')
        errorbar(1+u,Prec.Raw_N2.Ms,Prec.Raw_N2.Es,'-','LineWidth',1.5,'color',colR);
        plot(1.2+u,Prec.Raw_N2.Mf,'.','MarkerSize',10,'color',colB); text(1.2+3*u,Prec.Raw_N2.Mf,'N2')
        errorbar(1.2+u,Prec.Raw_N2.Mf,Prec.Raw_N2.Ef,'-','LineWidth',1.5,'color',colB);
        
        plot(1+v,Prec.Rhy_N3.Ms,'.','MarkerSize',30,'color',colR); text(1+5*v,Prec.Rhy_N3.Ms,'N3')
        errorbar(1+v,Prec.Rhy_N3.Ms,Prec.Rhy_N3.Es,'-','LineWidth',1.5,'color',colR);
        plot(1.2+v,Prec.Rhy_N3.Mf,'.','MarkerSize',30,'color',colB);  text(1.2+5*v,Prec.Rhy_N3.Mf,'N3')
        errorbar(1.2+v,Prec.Rhy_N3.Mf,Prec.Rhy_N3.Ef,'-','LineWidth',1.5,'color',colB);
        text(1.1,0.255,'( Rhythmic )','Rotation',0,'FontSize',14,'HorizontalAlignment','center','FontWeight','bold')

        plot(1+v,Prec.Raw_N3.Ms,'.','MarkerSize',10,'color',colR); text(1+5*v,Prec.Raw_N3.Ms,'N3')
        errorbar(1+v,Prec.Raw_N3.Ms,Prec.Raw_N3.Es,'-','LineWidth',1.5,'color',colR);
        plot(1.2+v,Prec.Raw_N3.Mf,'.','MarkerSize',10,'color',colB); text(1.2+5*v,Prec.Raw_N3.Mf,'N3')
        errorbar(1.2+v,Prec.Raw_N3.Mf,Prec.Raw_N3.Ef,'-','LineWidth',1.5,'color',colB);
        text(1.1,0.198,'( Raw )','Rotation',0,'FontSize',14,'HorizontalAlignment','center')
        ylim([0.17 0.32])
        xlim([.9 1.3])
        ax.XTick = [1 1.2];
        lab1 = sprintf('Slow Switchers');
        ax.XTickLabel = {lab1 'Fast Switchers'};
        ax.FontSize = 16;
        ylabel('PAC delta-sigma')
        plot([.9 1.23],[0.3 0.3],':k')
        plot([.9 1.23],[0.25 0.25],':k');
        
    title('PRECUNEUS','FontSize',18)
end