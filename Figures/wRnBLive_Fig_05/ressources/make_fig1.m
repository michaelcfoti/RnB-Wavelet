function f1 = make_fig1(Prec,Antc)

colR = [0.74 0 0.47];
colorpatchR = [255 90 90]/256;
f1 = figure('Position',[100 100 1000 320]); 

subplot(1,2,1); hold on; ax=gca; ax.Color = 'none';

    mSSWk = mean(Prec.SSWk,1);
    eSSWk = std(Prec.SSWk,[],1) / sqrt(size(Prec.SSWk,1));
    
plot(Prec.time,mSSWk,'LineWidth',2,'Color',colR);
    Xp = mSSWk - eSSWk;
    Yp = mSSWk + eSSWk;
    [X,Y] = region_patch(Prec.time,Yp,Xp);
    fill(X,Y,colorpatchR,'EdgeColor','none','FaceAlpha',.4);
    plot([-1.1 -1.1],[-4 -2],'-k','LineWidth',6.2)
    text(-1.2,-3,'2 mV','FontSize',12,'color','k','Rotation',90,'HorizontalAlignment','center');
    ylim([-6 6])
    xlim([Prec.time(1) Prec.time(end)])
title('PRECUNEUS','FontSize',18)
xlabel('Time (sec)','FontSize',14)
plot([-6 6],[0 0],'-k','LineWidth',1.1)
    
subplot(1,2,2); hold on; ax=gca; ax.Color = 'none';

    mSSWk = mean(Antc.SSWk,1);
    eSSWk = std(Antc.SSWk,[],1) / sqrt(size(Antc.SSWk,1));
    
plot(Antc.time,mSSWk,'LineWidth',2,'Color',colR);
    Xp = mSSWk - eSSWk;
    Yp = mSSWk + eSSWk;
    [X,Y] = region_patch(Antc.time,Yp,Xp);
    fill(X,Y,colorpatchR,'EdgeColor','none','FaceAlpha',.4);
    ylim([-6 6])
    xlim([Antc.time(1) Antc.time(end)])
title('ANT. CINGULATE','FontSize',18)
plot([-6 6],[0 0],'-k','LineWidth',1.1)
xlabel('Time (sec)','FontSize',14)
    
end

function [X,Y] = region_patch(x,yu,yd)

    ux = x;
    uy = yu;
    vx = x;
    vy = yd;

    X = [ux(1:end-1);ux(2:end);vx(2:end);vx(1:end-1)];
    Y = [uy(1:end-1);uy(2:end);vy(2:end);vy(1:end-1)];

end