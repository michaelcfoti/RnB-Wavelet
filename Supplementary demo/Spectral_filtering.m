function Spectral_filtering()

clc;clear;close all;
restoredefaultpath;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Integrate data and RnB_v01 library
addpath(fullfile(fileparts(mfilename('fullpath')), '..', 'data'));
addpath(genpath(fullfile(fileparts(mfilename('fullpath')), '..', 'RnB_v01')));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example (single epoch)                               
load('R37_N3.mat')
data0 = data_epochs(2,:);                      
time = (0:(numel(data0)-1))/fs;                
W = RnB_compute_spectre_brut(data0,fs);               
param.nresamp = 60;                                    
param.frange  = [3 45];                                
[P,R] = RnB_clean_spectrum_1of(data0,fs,param);       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Display
    figure('position',[235 365 1515 462]);
    colR = [161 22 50]/256;
    colB = [0 0.47 0.74];
    
    % Signal
    subplot(1,7,[1 2 3]);
    ax0 = gca;
    plot(time,data0,'LineWidth',1.35,'Color','k');
    setupAxes(ax0,false,[0 time(end)], []);
    xlabel('Time (sec)','FontSize',12);
    ylabel('Single time series','FontSize',22,'FontWeight','bold')
    
    % Power spectrum
    subplot(1,7,[4 5]);
    hold on; ax1 = gca;
    plot(log(W.fr),log(W.pw),'LineWidth',1.15,'color',colB);
    setupAxes(ax1,true,log([0.2 64]), [-8 8]);
    xlabel('Frequency (Hz)','FontSize',12);
    ylabel('Power Spectrum Density','FontSize',12)
    title('\Gamma_i (power spectrum)','FontSize',16,'FontAngle','italic')
    
    % Arrythmic spectrum
    hold off
    subplot(1,7,[6 7]);
    hold on; ax2 = gca;
    plot(log(P.f_k),log(P.Q_k),'LineWidth',1.3,'color',colR);
    setupAxes(ax2,true,log([0.2 64]), [-8 8]);
    xlabel('Frequency (Hz)','FontSize',12);
    title('Q_i (''Arrhythmic'' spectrum)','FontSize',16,'FontAngle','italic')
    text(log(0.5),5,sprintf('beta = %4.2f',R.beta),'FontSize',16,'FontAngle','italic','Color',colR)
    
    hold off
end