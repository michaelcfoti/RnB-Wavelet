function  f3 = make_fig3(ws500,wavelet)

f3 = figure('Position',[100 100 500 420]);
    fig.handle = f3;
    fig.ran = 2; 
    fig.col = 3; 
    fig.pos = [1 2 3 4 5 6];
    display_just_time_scale_boxes(ws500,wavelet,fig);
    xlabel('time (sec)','FontSize',14);
    xlim([0.0 20.5])
    ylim([0.00 7.00])
end