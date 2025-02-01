function [wt,r] = soft_schrinkage(w,J)
% Apply soft schrikange on wavelets
%
% INPUTS:
%     - w: Wavelet coefficients
%
%     - J: number of wavelet decomposition scale in w
%
% OUTPUTS:
%     - wt:'schrinked' wavelet coefficients 
%
%     - r: Percentage of coefficients equal to zero

    soft = @(x,l)(max(abs(x)-l,0));
    jnoise =1;
    N  = length(w);
    wt = [];
    o = 1;
    for j = 1:J
        N = N/2;
        a = o:(o-1)+N;
        o = o + N;
        wt(1,a) = a;
        wt(2,a) = w(a);
        wt(3,a) = j*ones(1,N);
    end
    % threshold for schrinkage: 
    sigma  = mad(wt(2,wt(3,:)==jnoise),1);
    lambda = sigma*sqrt(2*log(length(w)));
    % schrinkage:
    nWt = soft(wt(2,:),lambda) .* sign(wt(2,:));
    r   = 100*sum(nWt==0) / length(nWt);
    w(wt(1,:)) = nWt; wt = w;
end