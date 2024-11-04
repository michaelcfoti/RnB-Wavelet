function f3 = make_fig3(Prec,Antc)

f3 = figure('Position',[100 100 1000 320]); 

    subplot(1,2,1); hold on; ax=gca; ax.Color = 'none';

    image('XData',Prec.Fast.wtime,'YData',Prec.Fast.Wfr,'CData',Prec.Fast.cfsmF,'CDataMapping','scaled')
    set(gca,'YScale','log'); hold on; 
    axis tight;
    ax.YTick = [2 4 8 16 32 64];
    ax.YTickLabel = {'2 Hz' '4 Hz' '8 Hz' '16 Hz' '32 Hz' '64 Hz'};
    ax.FontSize = 14;
    plot([0 0] ,[Prec.Fast.Wfr(1) Prec.Fast.Wfr(end)],':','LineWidth',2,'color','w');
    plot([0.240 0.240] ,[Prec.Fast.Wfr(1) Prec.Fast.Wfr(end)],':','LineWidth',1.5,'color','w');
    text(-0.65,13.48,'13.48 Hz','FontSize',14,'color','k');
    text(-0.65,6.84,'6.84 Hz','FontSize',14,'color','k');
    text(-0.100,5,'transition','FontSize',14,'Rotation',90,'color','k');
    text(0.340,16,'max. peak','FontSize',14,'Rotation',90,'color','k');
    xlabel('Seconds','FontSize',14)
    ylabel('INDUCED SCALOGRAMS','FontSize',16)
    axis square
    title('PRECUNEUS','FontSize',18)

    subplot(1,2,2); hold on; ax=gca; ax.Color = 'none';

    image('XData',Antc.Fast.wtime,'YData',Antc.Fast.Wfr,'CData',Antc.Fast.cfsmF,'CDataMapping','scaled')
    set(gca,'YScale','log'); hold on; 
    axis tight;
    ax.YTick = [2 4 8 16 32 64];
    ax.YTickLabel = {'2 Hz' '4 Hz' '8 Hz' '16 Hz' '32 Hz' '64 Hz'};
    ax.FontSize = 14;
    plot([0 0] ,[Antc.Fast.Wfr(1) Antc.Fast.Wfr(end)],':','LineWidth',2,'color','w');
    plot([0.140 0.140] ,[Antc.Fast.Wfr(1) Antc.Fast.Wfr(end)],':','LineWidth',1.5,'color','w');
    text(-0.65,12.7,'12.7 Hz','FontSize',14,'color','k');
    text(-0.100,5,'transition','FontSize',14,'Rotation',90,'color','k');
    text(0.240,17,'max. peak','FontSize',14,'Rotation',90,'color','k');
    xlabel('Seconds','FontSize',14)
    axis square
    title('ANT. CINGULATE','FontSize',18)
end