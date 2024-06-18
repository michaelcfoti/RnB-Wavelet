function f3 = make_fig3(A)

f3=figure('position',[300 400 900 200]); hold on
ax = gca;
ax.Color = 'none';
colR = [161 22 50]/256;
Namp = size(A.TBeta,2);

    violin(A.TBeta,'facecolor',colR,'edgecolor','k','bw',0.055,'mc',[],'medc','k-');
    plot([0 15],[A.beta A.beta],':k','LineWidth',1.5)
    ax.XTick = 1:Namp;
    ax.XTickLabel = A.Amp_in;
    ax.FontSize = 8;
    xlabel('3Hz-amplitude in (A.U.)','FontSize',12)
    ylabel('$\beta^*$','FontSize',18,'Interpreter','latex')
    ylim([1 3])
    %axis square
    grid on
    
end