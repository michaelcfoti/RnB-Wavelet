function f1 = make_fig2(Prec)

f1 = figure('Position',[100 100 900 320]); 

colG1 = [0 0.74 0.37];
colG2 = [0.37 0.84 0.37];
u =  0.01;
v = -0.01;
subplot(1,4,[2 3]); hold on; ax=gca; ax.Color = 'none';

        plot(1.2+u,Prec.RhyTheta_N2.Ms,'o','MarkerSize',8,'MarkerEdgeColor','k','MarkerFaceColor',colG1);
        errorbar(1.2+u,Prec.RhyTheta_N2.Ms,Prec.RhyTheta_N2.Es,'-','LineWidth',1.5,'color',colG1);
        ttt = sprintf('N2');
        text(1.24344827586207,Prec.RhyTheta_N2.Ms,ttt,'HorizontalAlignment','center');
        xlim([.2 1.3]);
        ax.XTick = [1.1];
        ylim([0.17 0.32])
        
        plot(1+u,Prec.RhynoTheta_N2.Ms,'o','MarkerSize',6,'MarkerEdgeColor','k','MarkerFaceColor',colG2);
        errorbar(1+u,Prec.RhynoTheta_N2.Ms,Prec.RhynoTheta_N2.Es,'-','LineWidth',1.5,'color',colG2);
        ttt = sprintf('N2');
        text(1.04172413793103,Prec.RhynoTheta_N2.Ms,ttt,'HorizontalAlignment','center');
        ax.XTick = [1.1];
        ylim([0.17 0.32])
        
        u = -0.01;
        plot(1.2+u,Prec.RhyTheta_N3.Ms,'o','MarkerSize',8,'MarkerEdgeColor','k','MarkerFaceColor',colG1);
        errorbar(1.2+u,Prec.RhyTheta_N3.Ms,Prec.RhyTheta_N3.Es,'-','LineWidth',1.5,'color',colG1);
        ttt = sprintf('N3');
        text(1.15620689655172,Prec.RhyTheta_N3.Ms,ttt,'HorizontalAlignment','center');

        plot(1+u,Prec.RhynoTheta_N3.Ms,'o','MarkerSize',6,'MarkerEdgeColor','k','MarkerFaceColor',colG2);
        errorbar(1+u,Prec.RhynoTheta_N3.Ms,Prec.RhynoTheta_N3.Es,'-','LineWidth',1.5,'color',colG2);
        ttt = sprintf('N3');
        text(0.971724137931035,Prec.RhynoTheta_N3.Ms,ttt,'HorizontalAlignment','right');
        xlim([.5 1.5])
        ax.XTick = [1 1.2];
        ax.XTickLabel = {'rSSW-TB' 'rSSW+TB'};
        ax.FontSize = 16;
        ylim([0.17 0.32])
        xlim([.9 1.3])
        plot([.7 1.47],[0.3 0.3],':k')
        plot([.7 1.47],[0.25 0.25],':k')
        


        
    title('PRECUNEUS','FontSize',18)
end