function f2 = make_fig2(Prec,Antc)
colB = [0 0.47 0.74];
colorpatchB = [90 90 90]/256;
colorpatchR = [90 90 255]/256;

f2 = figure('Position',[100 100 1000 320]); 

subplot(1,2,1); hold on; ax=gca; ax.Color = 'none';
    % Slow
    mSSWs = mean(Prec.SSWs,1);
    eSSWs = std(Prec.SSWs,[],1) / sqrt(size(Prec.SSWs,1));
    plot(Prec.swtime,mSSWs,'LineWidth',2,'Color','k');
    Xp = mSSWs - eSSWs;
    Yp = mSSWs + eSSWs;
    [X,Y] = region_patch(Prec.swtime,Yp,Xp);
    fill(X,Y,colorpatchB,'EdgeColor','none','FaceAlpha',.4);
    % fast
    mSSWk = mean(Prec.SSWf,1);
    eSSWk = std(Prec.SSWf,[],1) / sqrt(size(Prec.SSWf,1));
    plot(Prec.swtime,mSSWk,'LineWidth',2,'Color',colB);
    Xp = mSSWk - eSSWk;
    Yp = mSSWk + eSSWk;
    [X,Y] = region_patch(Prec.swtime,Yp,Xp);
    fill(X,Y,colorpatchR,'EdgeColor','none','FaceAlpha',.4);

    mess = sprintf('Over %3.1f minutes:\n%d slow switchers\n%d fast switchers',Prec.totime,Prec.n_slow,Prec.n_fast);
    text(-1.2,6,mess,'FontWeight','bold');
    mess = sprintf('Densities:\n%3.1f /mn (slow)\n%3.1f /mn (fast)',Prec.n_slow/Prec.totime,Prec.n_fast/Prec.totime);
    text(-1.2,-4,mess);
    plot([-1.1 -1.1],[2 4],'-k','LineWidth',6.2)
    text(-1.2,3,'2 mV','FontSize',12,'color','k','Rotation',90,'HorizontalAlignment','center');
    text(0.44,4,'Slow Switchers','FontSize',16)
    text(0.44,3,'Fast Switchers','FontSize',16,'Color',colB)
    xlim([Prec.swtime(1) Prec.swtime(end)])
    plot([0 0],[-6 6],'--k','LineWidth',1.2)
    ylim([-6 7])
    xlabel('time (sec)','FontSize',14)

    title('PRECUNEUS','FontSize',18)
    
subplot(1,2,2); hold on; ax=gca; ax.Color = 'none';
    % slow:
    mSSWs = mean(Antc.SSWs,1);
    eSSWs = std(Antc.SSWs,[],1) / sqrt(size(Antc.SSWs,1));
    plot(Antc.swtime,mSSWs,'LineWidth',2,'Color','k');
    Xp = mSSWs - eSSWs;
    Yp = mSSWs + eSSWs;
    [X,Y] = region_patch(Antc.swtime,Yp,Xp);
    fill(X,Y,colorpatchB,'EdgeColor','none','FaceAlpha',.4);
    % fast
    mSSWk = mean(Antc.SSWf,1);
    eSSWk = std(Antc.SSWf,[],1) / sqrt(size(Antc.SSWf,1));
    plot(Antc.swtime,mSSWk,'LineWidth',2,'Color',colB);
    Xp = mSSWk - eSSWk;
    Yp = mSSWk + eSSWk;
    [X,Y] = region_patch(Antc.swtime,Yp,Xp);
    fill(X,Y,colorpatchR,'EdgeColor','none','FaceAlpha',.4);

    mess = sprintf('Over %3.1f minutes:\n%d slow switchers\n%d fast switchers',Antc.totime,Antc.n_slow,Antc.n_fast);
    text(-1.2,6,mess,'FontWeight','bold');
    mess = sprintf('Densities:\n%3.1f /mn (slow)\n%3.1f /mn (fast)',Antc.n_slow/Antc.totime,Antc.n_fast/Antc.totime);
    text(-1.2,-4,mess);
    plot([-1.1 -1.1],[2 4],'-k','LineWidth',6.2)
    text(-1.2,3,'2 mV','FontSize',12,'color','k','Rotation',90,'HorizontalAlignment','center');
    text(0.54,4,'Fast Switchers',...
    'Color',[0 0.47 0.74],'FontSize',16);
    text(0.54,5,'Slow Switchers','FontSize',16,...
    'Color',[0 0 0]);
    xlim([Antc.swtime(1) Antc.swtime(end)])
    plot([0 0],[-6 6],'--k','LineWidth',1.2)
    ylim([-6 7])
    xlabel('time (sec)','FontSize',14)

    title('ANT. CINGULATE','FontSize',18)
   
end


function [X,Y] = region_patch(x,yu,yd)

    ux = x;
    uy = yu;
    vx = x;
    vy = yd;

    X = [ux(1:end-1);ux(2:end);vx(2:end);vx(1:end-1)];
    Y = [uy(1:end-1);uy(2:end);vy(2:end);vy(1:end-1)];

end