function wRnB()

clc; clear; close all;
restoredefaultpath;

%  RnB library
addpath(genpath('./functions'), 'data')

load('R37_N3.mat');

fprintf('\n    Data:\n');
fprintf('\t . %d epochs\n',size(data_epochs,1))
fprintf('\t . %d samples (%4.2f seconds @ %4.2f Hz)\n\n',size(data_epochs,2),size(data_epochs,2)/fs,fs);
fprintf('\nProcessing...\n\n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                            
[sR, pW] = rnbWavelet(data_epochs,'J', 9, 'betaScales', [1,9]);
pR      = computeSpectrum(sR,fs);                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

% Save 
if exist('sR','var')
    fprintf(' -- You saved in ''wRnB_results.mat'' the following results\n');
    fprintf('\t . The rhythmic signals (sR : epochs x time)\n');
    fprintf('\t . The beta exponents (betas : epochs x 1)\n');
    betas = pW.betas;
    save('wRnB_results.mat','betas','sR');
end

% Display
makeFigure(pR,pW,sR,region);
fprintf('\nBye.\n')
end
