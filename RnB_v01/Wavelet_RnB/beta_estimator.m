function beta = beta_estimator(w,J,j12)
% Calculate beta based on wavelet coefficients 
%
% INPUTS:
%     - w: wavelet coefficients 
%
%     - J:  number of wavelet decomposition scale in w
%
%     - J12: []
%       
% OUTPUTS:
%     - beta: beta value for one epoch

    N = length(w);
    o = 1; N0 = N;
    for j = 1:J
        N = N/2;
        a = o:(o-1)+N;
        o = o + N;
        etaj(j) = sum(abs(w(a)).^2);
        nj(j)   = numel(a);
        etaj(j) = log2(etaj(j)/nj(j));
        Sj(j)   = N0*log(2)*log(2)/2/2^j;
        jSj(j)  = j*Sj(j);
        j2Sj(j) = j*jSj(j);
        eSj(j)  = etaj(j)*Sj(j);
        jeSj(j) = j*eSj(j);
    end
    if isempty(j12), j1 = 1; j2 = J-2; else, j1 = 1; j2 = 5; end
    beta = (sum(Sj(j1:j2))*sum(jeSj(j1:j2)) - sum(jSj(j1:j2))*sum(eSj(j1:j2)))./ ...
        (sum(Sj(j1:j2))*sum(j2Sj(j1:j2)) - sum(jSj(j1:j2))*sum(jSj(j1:j2)));     
end
        
