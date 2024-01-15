function RnB_wavelet_main()

clc; clear; close all;
restoredefaultpath;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Integrate RnB_v01 library
addpath(genpath('./RnB_v01'), 'data')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example (320 epochs, Hippocampus)                            
load('R37_N3.mat')
[sR, pW] = wRnB_extract_Rhythmic_signals(data_epochs,'alpha',4,'J', 8);
pR      = RnB_compute_spectre_brut(sR,fs);                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Display
    figure('position',[400 160 800 340]);
    colR = [161 22 50]/256;
    
    % Average spectral analysis of rhytmics signals
    subplot(1,2,2)
    hold on; ax0 = gca;
    plot(log(pR.fr),smooth(pR.pw),'-k','LineWidth',2,'color',colR);
    setupAxes(ax0,true,log([1 64]), []);
    text(log(2),1.8,sprintf('%d epochs',size(sR,1)),'FontSize',14);
    xlabel('Frequency (Hz)','FontSize',16);
    ylabel('Rhythmic Power Spectral Density (dB)','FontSize',14);
    
    % Beta distribution
    subplot(1,2,1)
    hold on; ax = gca; ax.Color = 'none';
    [a,b] = hist(pW.betas,60);
    p = a/sum(a) / (b(2)-b(1));
    plot(b,p,'.');
    b = b(2:end-1);
    plot([2 2],[0 3.2],':k','LineWidth',2);
    plot(b,smooth(p(2:end-1),7),'-','LineWidth',2,'Color',colR);
    plot([pW.beta pW.beta],[0 3],'--k','LineWidth',2);
    text(pW.beta,3.2,sprintf('beta = %3.1f [%3.1f,%3.1f] ',pW.beta, pW.bMin, pW.bMax),'FontSize',18,'HorizontalAlignment','center','FontAngle','italic')
    xlabel('$\beta$','FontSize',20,'Interpreter','latex')
    ylabel(region,'FontSize',22,'FontWeight','bold')
    hold off
    
end