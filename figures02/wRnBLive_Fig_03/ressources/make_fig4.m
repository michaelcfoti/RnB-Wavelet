function f4 = make_fig4(Prec,Antc)
colR = [0 0.47 0.74];
colB = [0.74 0 0.47];
f4 = figure('position',[100 100 1100 400]); 

subplot(1,2,1); hold on ; ax = gca; ax.Color = 'none';
plot(Prec.N2.figu4.lRP.freq, Prec.N2.figu4.lRP.rExp,'-','LineWidth',1.75,'Color',colR);
plot(Prec.N3.figu4.lRP.freq,Prec.N3.figu4.lRP.rExp,'-','LineWidth',1.5,'Color',colB);

     plot(log(Prec.N2.figu4.lRP.frange),[1 1],':k','linewidth',2);
     plot(log([13.3 13.3]),[0 4.2],':k','linewidth',1.5);
     plot([1.45 1.45],[0 1.5],':k','linewidth',1.5);
     ylimite = [0 6];
        YL = ylim;
        r = YL(2)*0.68;
        s = YL(2)*0.78;
        text('HorizontalAlignment','left','FontSize',18,...
        'String','13.3 Hz',...
        'Position',[log(14) 5.5 0],...
        'Rotation',0);
         ax.XTick = log([1 2 4 8 16 32 64 128]);
         ax.XTickLabel = {'1' '2' '4' '8' '16' '32' '64' '128'};
         ax.FontSize = 18;
         ylim(ylimite)
         xlabel('Hz','FontSize',18);
         ylabel('$e^{R(f)}$','Interpreter','latex','FontSize',30);
         title('PRECUNEUS','FontSize',18)
         
         
subplot(1,2,2); hold on ; ax = gca; ax.Color = 'none';
plot(Antc.N2.figu4.lRP.freq, Antc.N2.figu4.lRP.rExp,'-','LineWidth',1.75,'Color',colR);
plot(Antc.N3.figu4.lRP.freq, Antc.N3.figu4.lRP.rExp,'-','LineWidth',1.5,'Color',colB);

     plot(log(Antc.N2.figu4.lRP.frange),[1 1],':k','linewidth',2);
     plot(log([11.8 11.8]),[0 4.2],':k','linewidth',1.5);
     plot([1.45 1.45],[0 1.5],':k','linewidth',1.5);
     ylimite = [0 6];
        YL = ylim;
        r = YL(2)*0.68;
        s = YL(2)*0.78;
        text('HorizontalAlignment','left','FontSize',18,...
        'String','11.8 Hz',...
        'Position',[log(13) 5.5 0],...
        'Rotation',0);
         ax.XTick = log([1 2 4 8 16 32 64 128]);
         ax.XTickLabel = {'1' '2' '4' '8' '16' '32' '64' '128'};
         ax.FontSize = 18;
         ylim(ylimite)
         xlabel('Hz','FontSize',18);
         ylabel('$e^{R(f)}$','Interpreter','latex','FontSize',30);
         title('ANT. CINGULATE','FontSize',18)
end

