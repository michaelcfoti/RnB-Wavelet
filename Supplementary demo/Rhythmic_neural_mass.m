function Rhytmic_neural_mass()

clc;clear;close all;
restoredefaultpath;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Integrate data and RnB_v01 library
addpath(fullfile(fileparts(mfilename('fullpath')), '..', 'data'));
addpath(genpath(fullfile(fileparts(mfilename('fullpath')), '..', 'RnB_v01')));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example: unique time series scale-free + neural mass
load('data_simul.mat')
[sR, pW] = wRnB_extract_Rhythmic_signals(data,'alpha', 4,'J', 8);
pR      = RnB_compute_spectre_brut(sR,fs);                    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Display
    colR = [161 22 50]/256;
    figure('position',[376 254 1099 568]);
    
    % Power spectrum
    subplot(2,4,[3 4 7 8])
    hold on; ax = gca; ax.Color = 'none';
    plot(log(pR.fr),smooth(pR.pw),'-k','LineWidth',2,'color',colR);
    text(log(1.5),2*10^-9,['$$\beta^* =$$' sprintf(' %4.2f',pW.betas)],'Interpreter','latex','FontSize',20)
    xlim(log([1 64]))
    ax.XTick = log([1 2 4 8 16 32]);
    ax.XTickLabel = {'1' '2' '4' '8' '16' '32'};
    text(log(2),1.8,sprintf('%d epochs',size(sR,1)),'FontSize',14);
    xlabel('Frequency (Hz)','FontSize',16);
    ylabel('Rhythmic Power Spectral Density (dB)','FontSize',12);
    
    % Signal
    subplot(2,4,[1 2])
    hold on; ax = gca; ax.Color = 'none';
    plot(time,data)
    
    % Rhytmic signal
    subplot(2,4,[5 6])
    hold on; ax = gca; ax.Color = 'none';
    plot(time,sR)
    xlabel('Time (sec)','FontSize',16);

end