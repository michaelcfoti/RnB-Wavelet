function f2 = make_fig2(A,B)

f2=figure('position',[300 400 900 200]); hold on
ax = gca;
ax.Color = 'none';
colR = [161 22 50]/256;

    subplot(1,3,2); hold on
    ax = gca; ax.Color = 'none';
    Namp = size(A.T13Hz,2);
    violin(A.T13Hz,'facecolor',colR,'edgecolor','k','bw',0.03,'mc',[],'medc','k-');
    plot([1 Namp],[2.1 2.1],':k','LineWidth',2)
    ax.XTick = 1:Namp;
    ax.XTickLabel = A.Amp_in;
    ax.FontSize = 8;
    xlabel('3Hz-amplitude in (A.U.)','FontSize',12)
    ylabel('13Hz-amplitude out (A.U.)','FontSize',12)
    ylim([1.5 3])
    axis square
    grid on
    
    subplot(1,3,1); hold on
    ax = gca; ax.Color = 'none';
    violin(B.T03Hz,'facecolor',colR,'edgecolor','k','bw',0.04,'mc',[],'medc','k-');
    plot(B.Plin(1,:),B.Plin(2,:),':k','LineWidth',2)
    ax.XTick = 1:Namp;
    ax.XTickLabel = B.Amp_in;
    ax.FontSize = 8;
    xlabel('3Hz-amplitude in (A.U)','FontSize',12)
    ylabel('3Hz-amplitude out (A.U)','FontSize',12)
    axis square
    grid on
    
end