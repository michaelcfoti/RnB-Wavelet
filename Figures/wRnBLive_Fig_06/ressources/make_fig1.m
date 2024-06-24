function f1 = make_fig1(Prec,Antc)

colB = [0 0.47 0.74];
f1 = figure('Position',[100 100 1000 320]); 

subplot(1,2,1); hold on; ax=gca; ax.Color = 'none';

for i = 1:3
    bs = sqrt(Prec.GMd.Sigma(i));
    ps = Prec.GMd.ComponentProportion(i);
    dfi = ps/sqrt(2*pi)/bs*exp(-0.5*((Prec.fr-Prec.bm(i))./bs).^2);
    plot(Prec.fr,dfi,'color','k','LineWidth',1);
end

    plot(Prec.fr,Prec.df,'color','k','LineWidth',2.2);    
    mess = sprintf('%3.2f Hz',Prec.fr_frontier);
    text(Prec.fr_frontier,1.2,mess,'FontSize',14,'HorizontalAlignment','center','Rotation',90);
    text(Prec.bm(2),0.25,'slow','HorizontalAlignment','center','color','k','FontSize',19,'Rotation',90);
    text(Prec.bm(1),0.25,'fast','HorizontalAlignment','center','color',colB,'FontSize',19,'Rotation',90);
    plot([Prec.fr_frontier Prec.fr_frontier],[0 1],':k','LineWidth',1.5)
    xlim([0.3 3.5])
    xlabel('Transition frequency (Hz)','FontSize',14)
    title('PRECUNEUS','FontSize',18)

subplot(1,2,2); hold on; ax=gca; ax.Color = 'none';

for i = 1:3
    bs = sqrt(Antc.GMd.Sigma(i));
    ps = Antc.GMd.ComponentProportion(i);
    dfi = ps/sqrt(2*pi)/bs*exp(-0.5*((Antc.fr-Antc.bm(i))./bs).^2);
    plot(Antc.fr,dfi,'color','k','LineWidth',1);
end

    plot(Antc.fr,Antc.df,'color','k','LineWidth',2.2);
    mess = sprintf('%3.2f Hz',Antc.fr_frontier);
    text(Antc.fr_frontier,1,mess,'FontSize',14,'HorizontalAlignment','center','Rotation',90);
    text(Antc.bm(1),0.25,'slow','HorizontalAlignment','center','color','k','FontSize',19,'Rotation',90);
    text(Antc.bm(2),0.25,'fast','HorizontalAlignment','center','color',colB,'FontSize',19,'Rotation',90);
    plot([Antc.fr_frontier Antc.fr_frontier],[0 0.8],':k','LineWidth',1.5)
    xlim([0.3 3.5])
    xlabel('Transition frequency (Hz)','FontSize',14)
    title('ANT. CINGULATE','FontSize',18)
end