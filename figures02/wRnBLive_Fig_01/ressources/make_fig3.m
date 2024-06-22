function  f3 = make_fig3(subpl2,subpl3,beta)

f3 = figure('Position',[100 100 750 300]);
colB = [0 0.447 0.741];

subplot(1,2,1); hold on ; ax = gca; ax.Color = 'none';
     plot(subpl2.x2,subpl2.y2,'-', ...  
     'LineWidth',1.55,'Color',colB);
     plot(log([1 64]),[1 1],':k','linewidth',2);       
     ax.XTick = log([1 2 4 8 16 32 64]);                 
     ax.XTickLabel = {'1' '2' '4' '8' '16' '32' '64'}; 
     ylim([0.5 7]);                                        
     xlabel('Hz','FontSize',22);                  
     ylabel('Rhythmic factor','FontSize',22);     
     text('Position',[1.5 2 0],'String','$e^{R^*(f)}$','Interpreter','latex','FontSize',26,'Color',colB);
     
    a = sprintf('This result shows that the');
    text(log(2.1),6,a,'FontSize',15,'Interpreter','latex')
    a = sprintf('power sepctrum of the');
    text(log(2.1),5.4,a,'FontSize',15,'Interpreter','latex')
    a = sprintf('process is of the form:');
    text(log(2.1),4.8,a,'FontSize',15,'Interpreter','latex')
    text(log(2.1),4,'$\Gamma(f) \approx {{e^{R^*(f)}}\over{f^{\beta^*}}} \approx {c\over{f^{\beta^*}}}$','Interpreter','latex','FontSize',15)     

subplot(1,2,2); hold on ; ax = gca; ax.Color = 'none';

    plot(subpl3.x1,subpl3.y1,':k','LineWidth',1.8);
    ylim([0 3])
    plot(subpl3.x2,subpl3.y2,'-k','LineWidth',2);
    plot(subpl3.x3,subpl3.y3,':k','LineWidth',1.2);
    text(subpl3.x3(1),2.6,sprintf('%3.2f',beta),'Rotation',0,'FontSize',20,'HorizontalAlignment','center');
    xlabel('\beta^*','FontSize',22,'FontWeight','bold')
    ylabel('Probability distribution','FontSize',22);
    hold off
    

end