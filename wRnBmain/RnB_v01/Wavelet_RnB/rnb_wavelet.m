function [sR,param] = rnb_wavelet(s,varargin)
% Extract the rhytmic signal for each epoch of a dataset 
%
% INPUTS:
%     - s: EEG Data (Nepocs X Nsample) 
%          'Nsample' must be a power of 2 in length
%
%     - alpha: Regularity parameter of the reconstruction wavelet
%
%     - J: number of wavelet decomposition scale
%          'J' must be lower than the logarithm base 2 of 'Nsample'
%       
% OUTPUTS:
%     - sR: Extracted rhytmic signal (Nepocs X Nsamples)
%
%     - param: Structure containing the following fields:
%         - wavelet.alpha: Regularity parameter of the reconstruction wavelet, as specified in the input.
%         - wavelet.tau: Shift parameter of the wavelet.
%         - wavelet.type: Type of the wavelet used in the decomposition.
%         - wavelet.J: Highest wavelet decomposition scale used in the analysis.
%         - betas: Beta values calculed for each epoch
%         - beta: Mean of the beta values across all epochs. 
%         - bMin: min beta
%         - bMax: max beta
%
% References : - In progress (2024)
%             :- Blu, T. & Unser, M.,"The Fractional Spline Wavelet Transform: Definition and Implementation", Proc. IEEE International 
%                Conference on Acoustics, Speech, and Signal Processing (ICASSP'00), Istanbul, Turkey, Vol. {I}, pp. 512-515, June 5--9, 2000.  

addpath(genpath('FracSpline'))

% Default Wavelet parameters
J = 9;
tau    = 0;
alpha0 = 2;
betaScales = [1,J];
type   = 'ortho';

for i = 1:length(varargin)
    if ischar(varargin{i}) && i+1 <= length(varargin)
        if ~isempty(varargin{i+1})
            switch varargin{i}
                case 'J'
                    J = varargin{i+1};
                case 'betaScales'
                    betaScales = varargin{i+1};
            end
        end
    end
end

[nEpo,nSamples]=size(s);
maxScales  = nextpow2(nSamples);
if J > maxScales
    fprintf('\n Number of wavelet scales (J = %d)  is invalid.',J);
    J = maxScales - 2;
    fprintf(' J adusted to : %d \n', J);
end
if betaScales(2) > maxScales
    fprintf('\n Number of wavelet scales set for slope computation (betaScales = %d)  is invalid.\n',betaScales(2));
     betaScales(2) = maxScales - 2;
    fprintf(' betaScales adusted to : %d \n',  betaScales(2));
end



% Filters (considers only alpha value)
[FFTan,FFTsynthesisfilters] = FFTfractsplinefilters(N,alpha0,tau,type);

% Scale segment indices for wavelet representation
a(1)  = 1; nj(1) = N/2; b(1) = a(1)+nj(1)-1;
for i = 2:1+J, a(i)=a(i-1)+nj(i-1); nj(i) = nj(i-1)/2; b(i) = a(i)+nj(i)-1; end

% Initialize for output
sR = zeros(size(s));
BETAs = zeros(1,nEpo);

    for isignal = 1:nEpo

        % current epoch
        se = s(isignal,:);
        
        % Normalize epoch 
        nh = sqrt(se*se');
        sh = se./nh;

        % Calculate Beta
        BETAs(isignal) = RnBFracSplineAnal(se,betaScales,[],FFTan);
        alpha = BETAs(isignal)/2;
        
        % fprintf('(%d, %d: beta = %3.2f)\n',isignal,Nepo,2*alpha)
        
        % Analysis Filter (considers alpha and beta value)
        [FFTanalysisfilters,~]  = FFTfractsplinefilters(N,alpha0+alpha,tau,type);
        
        %  Wavelet analysis 
        w = FFTwaveletanalysis1D(sh,FFTanalysisfilters,J);
        
        % Denoising : soft schrinkage 
        [w,~] = soft_schrinkage(w,J);
        
        % Filtering arrhythmic component
        wr = zeros(size(w));
        for js = 1:J
            aWj = w(a(js):b(js));
            aWp = K(alpha,alpha0) * 2^(-js*alpha) * aWj;
            wr(a(js):b(js)) = aWp;
        end
        
        % Wavelet synthesis 
        sR(isignal,:) = FFTwaveletsynthesis1D(wr,FFTsynthesisfilters,J);
        sR(isignal,:) = sR(isignal,:) .* nh;

    end
    
    % Save filter paramater and slope values
    param.wavelet.alpha = alpha0;
    param.wavelet.tau   = tau;
    param.wavelet.type  = type;
    param.wavelet.J     = J;
    param.beta          = mean(BETAs,'omitnan');
    param.betas         = BETAs;
    param.bMin         = min(BETAs);
    param.bMax         = max(BETAs);

end