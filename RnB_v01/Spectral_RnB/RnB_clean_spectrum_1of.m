function [P,R] = RnB_clean_spectrum_1of(data,fs,param)
% WELCH-like resampling
% Formally used in IRASA (2015)
%
% INPUTS:
%     - data_epocs: EEG Data (Nepocs X Nsample) 
%
%     - fs: Sampling rate
%     
%     - param: Structure containing the following fields:
%         - frange: Range of frequencies for linear regression 
%         - nresamp: Number of resampling allowed
%
% OUTPUTS:
%     - P: Structure containing the following fields:
%         - W.f_k: Frequencies 
%         - W.Q_k: Resampled power spectrum 
%
%     - R: Structure containing the following fields:
%         - R.beta: Slope
%         - R.b: Intercept

if ~isempty(param) && isfield(param,'nresam')
    scales = linspace(1.02,1.98,param.nresam);
else
    scales = linspace(1.02,1.98,20);
end
Nscale = numel(scales); 

        Nwind = length(data);
        nwind = 1;owind=0;
        % Definition des frequences
        Nfrac = Nwind/2 + 1;
        freq = (fs/2)*linspace(0,1,Nfrac); 

        % Calcul du specte 'Welch' (pour chaque transformee d'echelle:
        Pow1 = NaN(Nscale,Nfrac);
        Pow2 = NaN(Nscale,Nfrac);
        % fenetres de Welch (on calcule les FFT des sous-fenetres: sera utile pour 
        % avoir des exposants plus 'locaux' (à la Welch). Aucune utilie
        % autre que cet acces.
        k  = 0:nwind-1;
        i0 = owind*k+1;
        i1 = i0+Nwind-1;
        sig = zeros(Nwind,nwind);
        %for k = 1:numel(i0), sig(:,k) = (hann_win.*data(i0(k):i1(k))'); end  
        for k = 1:numel(i0), sig(:,k) = data(i0(k):i1(k)); end  % <---- NO HANN
        W.fr = freq;
        W.pw = abs(fft(sig,Nwind)/Nwind)';
        W.pw = W.pw(:,1:numel(freq)).^2;
        
        for s = 1:Nscale
            a = scales(s);
            [p,q] = rat(a);

            % scale p/q:
            Nwind_rescaled = length(resample(double(sig),p,q));
            F = fft(sig,Nwind_rescaled)/Nwind_rescaled;
            nfill1 = min([Nfrac,ceil(Nwind_rescaled/2+1)]);
            po = (abs(F)').^2;
            pow1 = po(:,1:nfill1);
            % scale q/p:
            Nwind_rescaled = length(resample(double(sig),q,p));
            F = fft(sig,Nwind_rescaled)/Nwind_rescaled;
            nfill2 = min([Nfrac,ceil(Nwind_rescaled/2+1)]);
            po = (abs(F)').^2;
            pow2 = po(:,1:nfill2);

            Pow1(s,1:nfill1) = median(pow1,1,'omitnan');
            Pow2(s,1:nfill2) = median(pow2,1,'omitnan');
        end

        P1P2 = exp(mean(0.5*log(Pow1.*Pow2),1,'omitnan'));
        NoNaN = ~isnan(P1P2);
        freq = freq(NoNaN);
        Pow  = P1P2(NoNaN); 
        
        %%%%%%%%%%%%%%%%%%%%
        P.Q_k = Pow(2:end);  
        P.f_k = freq(2:end); 
        %%%%%%%%%%%%%%%%%%%%
        R.beta = [];
        R = myregression(P.f_k,P.Q_k,param);   
end   
