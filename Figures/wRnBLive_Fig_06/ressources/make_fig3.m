function f3 = make_fig3(Prec,Antc)
colB = [0 0.47 0.74];
f3 = figure('Position',[100 100 1000 320]);

subplot(1,2,1); hold on ; ax = gca; ax.Color = 'none';
plot(Prec.Fast.bb,Prec.Fast.db,'LineWidth',2.2,'color',colB);
plot(Prec.Fast.y,Prec.Fast.x,  '.','MarkerSize',6,'color',colB);
plot([2 2],[0 1.4],':k','LineWidth',1.75);
plot(Prec.Slow.bb,Prec.Slow.db,'LineWidth',2.2,'color','k');
plot(Prec.Slow.y,Prec.Slow.x,  '.','MarkerSize',6,'color','k');
plot([2 2],[0 1.4],'--k','LineWidth',2);
ylim([0 1.8])
xlim([0.5 3.2])
xlabel('$\beta^*$','Interpreter','Latex','FontSize',20)
ylabel('Probability dens.','FontSize',16)
text(1.25,1.45,'antipersistence','FontSize',14,'HorizontalAlignment','center','FontAngle','italic')
text(2.6,1.45,'persistence','FontSize',14,'HorizontalAlignment','center','FontAngle','italic')
    text(0.6,1,'Slow Switchers','FontSize',16)
    text(0.6,0.85,'Fast Switchers','FontSize',16,'Color',colB)
title('PRECUNEUS','FontSize',18)


subplot(1,2,2); hold on ; ax = gca; ax.Color = 'none';
plot(Antc.Fast.bb,Antc.Fast.db,'LineWidth',2.2,'color',colB);
plot(Antc.Fast.y,Antc.Fast.x,'.','MarkerSize',6,'color',colB);
plot([2 2],[0 1.4],'--k','LineWidth',2);
plot([2.29 2.29],[0 1.4],':k','LineWidth',1.25);
ylim([0 1.8])
xlabel('$\hat\beta$','Interpreter','Latex','FontSize',18)
plot(Antc.Slow.bb,Antc.Slow.db,'LineWidth',2.2,'color','k');
plot(Antc.Slow.y,Antc.Slow.x,  '.','MarkerSize',6,'color','k');
plot([2 2],[0 1.4],':k','LineWidth',1.75);
ylim([0 1.8])
xlim([0.5 3.2])
xlabel('$\beta^*$','Interpreter','Latex','FontSize',20)
ylabel('Probability dens.','FontSize',16)
text(1.25,1.45,'antipersistence','FontSize',14,'HorizontalAlignment','center')
text(2.6,1.45,'persistence','FontSize',14,'HorizontalAlignment','center')
    text(0.6,1,'Slow Switchers','FontSize',16)
    text(0.6,0.85,'Fast Switchers','FontSize',16,'Color',colB)
title('ANT. CINCULATE','FontSize',18)
hold off
    
end



