function [W] = computeSpectrum(data_epocs,fs)
% Compute average spectral analysis 
%
% INPUTS:
%     - data_epocs: EEG Data (Nepocs X Nsample) 
%
%     - fs: Sampling rate
%
% OUTPUTS:
%     - W: Structure containing the following fields:
%         - W.pw: Power
%         - W.fr: Frequencies 

[~,NtimePoints] = size(data_epocs);
Ntime90 = 2^floor(log2(0.9*NtimePoints));
Ntime = 2^(nextpow2(Ntime90));
offse = max([1,ceil((NtimePoints-Ntime)/2)]);
signal = data_epocs(:,offse:(offse+Ntime-1));
Nfrac = Ntime/2+1;
freq  = fs/2 * linspace(0,1,Nfrac);
F     = fft(signal',Ntime)' ./ Ntime;
W.pw = mean(abs(F(:,2:Nfrac)).^2,1);
W.fr = freq(2:Nfrac);
end
