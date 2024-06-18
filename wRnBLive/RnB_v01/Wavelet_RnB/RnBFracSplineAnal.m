function beta = RnBFracSplineAnal(s0,j12,alpha)
% Calculate Beta
%
% INPUTS:
%     - s0: EEG Data (Nepocs X Nsample) 
%          'Nsample' must be a power of 2 in length
%
%     - J12: []
%
%     - alpha: Regularity parameter of the reconstruction wavelet
%    
% OUTPUTS:
%     - beta: beta value for one epoch
    
    addpath(genpath('FracSpline'))
    if isempty(alpha), alpha = 4; end
    tau   = 0;
    type  = 'ortho';
    M1    = length(s0);
    J     = nextpow2(M1)-1;
    M2    = 2^nextpow2(M1);
    [FFTan,~] = FFTfractsplinefilters(M2,alpha,tau,type);
    % Perform a fractional spline wavelet transform of the signal
    w  = FFTwaveletanalysis1D(s0,FFTan,J);
    beta = beta_estimator(w,J,j12);

end