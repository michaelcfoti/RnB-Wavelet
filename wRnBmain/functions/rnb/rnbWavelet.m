function [sR,param] = rnbWavelet(s,varargin)

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
    
    p = inputParser;
    addRequired(p, 's', @(x) isnumeric(x) && ismatrix(x));
    addParameter(p, 'J', 9, @(x) isempty(x) || (isnumeric(x) && isscalar(x) && x > 0));
    addParameter(p, 'betaScales', [1, 9], @(x) isempty(x) || (isnumeric(x) && numel(x)==2 && all(x > 0)));
    parse(p, s, varargin{:});
    
    J = p.Results.J;
    betaScales = p.Results.betaScales;
    
    if isempty(J)
        J = 9;
    end
    
    if isempty(betaScales)
        betaScales = [1, 9];
    end
    
    % Default Wavelet parameters
    tau    = 0;
    alpha0 = 2;
    type   = 'ortho';   
    
    % Adjust the parameters if necessary based on the signal size using helper functions.
    J = checkJInput(s, J);
    betaScales = checkBetaScaleInput(s, betaScales);
    
    [nEpo,nSamples]=size(s);
    
    % Base filters (considers only alpha value)
    [FFTan,FFTsynthesisfilters] = FFTfractsplinefilters(nSamples,alpha0,tau,type);
    
    % Scale segment indices for wavelet representation
    [a, b] = computeScaleIndices(nSamples, J);
    
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
            BETAs(isignal) = rnbFracSplineAnal(se,betaScales,[],FFTan);
            alpha = BETAs(isignal)/2;
            
            % fprintf('(%d, %d: beta = %3.2f)\n',isignal,Nepo,2*alpha)
            
            % Analysis Filter (considers alpha and beta value)
            [FFTanalysisfilters,~]  = FFTfractsplinefilters(nSamples,alpha0+alpha,tau,type);
            
            %  Wavelet analysis 
            w = FFTwaveletanalysis1D(sh,FFTanalysisfilters,J);
            
            % Denoising : soft schrinkage 
            [w,~] = softSchrinkage(w,J);
            
            % Filtering arrhythmic component
            wr = filteArrhythmicComponent(w, a, b, alpha, alpha0, J);
    
            % Wavelet synthesis 
            sR(isignal,:) = FFTwaveletsynthesis1D(wr,FFTsynthesisfilters,J);
            sR(isignal,:) = sR(isignal,:) .* nh;
    
        end
            
        param = struct( ...
        'wavelet', struct('alpha', alpha0, 'tau', tau, 'type', type, 'J', J), ...
        'beta', mean(BETAs, 'omitnan'), ...
        'betas', BETAs, ...
        'bMin', min(BETAs), ...
        'bMax', max(BETAs) ...
        );

end