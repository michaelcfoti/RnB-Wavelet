function f1 = make_fig1(time,s)

f1 = figure('position',[100 100 700 300]);
hold on ; ax = gca; ax.Color = 'none'; 

fprintf('''Pure'' Scale-free: ');
epo =1;  
    plot(time(epo,:),s(epo,:),'LineWidth',1.25); 
    xlim([time(1) time(end)]);
    text(1.8,0.05,'$\beta=1.70$','FontSize',26,'Interpreter','latex','Rotation',0,'HorizontalAlignment','center','FontAngle','italic');
    xlabel('Seconds','FontSize',18);
         ylabel('Signal (Epoch ''$i$'')','FontSize',18,'Interpreter','latex');
         ylim([-0.06 0.08])
    hold off
end

