function wRnB()

clc; clear; close all;
restoredefaultpath;

%  RnB library
addpath(genpath('./RnB_v01'), 'data')

fprintf('\n -- RnB Algorithm:\n')
fprintf('    This code applies the ''rhythmic and\n')
fprintf('    arrhythmic'' decomposition of a batch\n')
fprintf('    of 20 seconds epochs.\n')
fprintf('    The data are extracted from the Atlas\n')
fprintf('    database (van Ellenrieder et al., 2019)\n\n')

    dbs = dir('data/R*');
    fprintf('    Available data are:\n')
    for i = 1:numel(dbs)
        load([dbs(i).folder filesep dbs(i).name],'region');
        fprintf('    . Region %d: %s\n',i,region)
    end
    index = input('    Select a region index: ');
    load([dbs(index).folder filesep dbs(index).name])

fprintf('\n    You selected: %s\n',region)
fprintf('\t . %d epochs\n',size(data_epochs,1))
fprintf('\t . %d samples (%4.2f seconds @ %4.2f Hz)\n\n',size(data_epochs,2),size(data_epochs,2)/fs,fs);
pause(0.75);
fprintf('(epoch,total = %d,beta exponent)\n',size(data_epochs,1));
pause(0.75);
fprintf('\nProcessing...\n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                         
[sR, pW] = wRnB_extract_Rhythmic_signals(data_epochs,'alpha', 4,'J', 8);
pR      = RnB_compute_spectre_brut(sR,fs);                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Display 
make_figure(pR,pW,sR,region);
fprintf('\nBye.\n')
end
