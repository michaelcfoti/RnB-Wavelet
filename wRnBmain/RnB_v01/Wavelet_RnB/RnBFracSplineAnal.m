function beta = RnBFracSplineAnal(s0,j12,FFTan)
% Calculate Beta
%
% INPUTS:
%     - s0: EEG Data (Nepocs X Nsample) 
%          'Nsample' must be a power of 2 in length
%
%     - J12: []
%
%     - FFTan: Analysis filter (considering only alpha value)
%    
% OUTPUTS:
%     - beta: Beta value for one epoch
    
    addpath(genpath('FracSpline'))
    M1    = length(s0);
    J     = nextpow2(M1)-1;
    %Perform a fractional spline wavelet transform of the signal
    w  = FFTwaveletanalysis1D(s0,FFTan,J);
    beta = beta_estimator(w,J,j12);

end