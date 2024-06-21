function wRnB()

clc; clear; close all;
restoredefaultpath;

%  RnB library
addpath(genpath('./RnB_v01'), 'data')

load('R37_N3.mat');

fprintf('\n    You selected: %s\n',region)
fprintf('\t . %d epochs\n',size(data_epochs,1))
fprintf('\t . %d samples (%4.2f seconds @ %4.2f Hz)\n\n',size(data_epochs,2),size(data_epochs,2)/fs,fs);
pause(0.75);
fprintf('(epoch,total = %d,beta exponent)\n',size(data_epochs,1));
pause(0.75);
fprintf('\nProcessing...\n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                         
[sR, pW] = wRnB_extract_Rhythmic_signals(data_epochs,'alpha', 4,'J', 8, 'betaScales', [2,9]);
pR      = RnB_compute_spectre_brut(sR,fs);                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


createDirectory('results');
betas = pW.betas;
save('results/rhythmic_signal.mat', 'sR','betas');

% Display 
make_figure(pR,pW,sR,region);
fprintf('\nBye.\n')
end
