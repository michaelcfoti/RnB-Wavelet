function f1 = make_fig1(A,B,C)

f1=figure('position',[300 400 900 200]); hold on
ax = gca;
ax.Color = 'none';
colR = [161 22 50]/256;

    subplot(1,3,1); hold on
    ax = gca; ax.Color = 'none';
    plot(A.time,A.timeseries_1sf,'LineWidth',1.1)
    text(0.5,3,['$$\beta = $$' sprintf('%4.2f',A.beta)],'Interpreter','latex','FontSize',18,'color',colR)
    xlabel('time','FontSize',14)
    ylabel('scale-free background (A.U.)','FontSize',13)
    ylim([-3 3])
    pause(0.001)
    
    subplot(1,3,2); hold on
    ax = gca; ax.Color = 'none';
    plot(B.time,B.neural_mass,'LineWidth',1.1);
    xlabel('time','FontSize',14)
    ylim([-0.5 0.5])
    annotation(f1,'arrow',[0.534444444444444 0.508888888888889],...
    [0.909 0.845],'LineWidth',1);
    annotation(f1,'arrow',[0.577777777777778 0.552222222222223],...
    [0.8465 0.7825],'LineWidth',1);
    text(5,0.5,'3Hz (variable)','FontSize',14)
    text('FontSize',14,'String','13Hz',...
    'Position',[6.375 0.346153846153846 0]);
    xlabel('time','FontSize',14);
    ylabel('oscillations (A.U.)','FontSize',13)
    pause(0.001)
    
    subplot(1,3,3); hold on
    ax = gca; ax.Color = 'none';
    plot(C.log_fr,C.power,'LineWidth',1.8,'Color','k');
    xlabel('Frequency (Hz)','FontSize',14)
    plot(log([3 3]),[0 6*10^-5],':k','LineWidth',1.2)
    plot(log([13 13]),[0 6*10^-5],':k','LineWidth',1.2)
    ax.XTick = log([0.5 1 2 4 8 16 32 64]);
    ax.XTickLabel = {'0.5' '1' '2' '4' '8' '16' '32' '64'};
    ax.FontSize = 11;
    text(log(3),6.5*10^-5,'3 Hz','HorizontalAlignment','center','FontSize',12)
    text(log(13),6.5*10^-5,'13 Hz','HorizontalAlignment','center','FontSize',12)
    ylabel('Rhythmic Power Spectral Density','FontSize',10)
    
end