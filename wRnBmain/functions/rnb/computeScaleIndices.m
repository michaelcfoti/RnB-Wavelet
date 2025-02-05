function [a, b] = computeScaleIndices(nSamples, J)
% Scale segment indices for wavelet representation
% INPUTS:
%     - nSamples: signal samples
%
%     - J: number of wavelet decomposition scale in w
%
% OUTPUTS:
%     - wt:'schrinked' wavelet coefficients 
%
%     - r: Percentage of coefficients equal to zero

    a(1)  = 1; 
    nj(1) = nSamples/2; 
    b(1) = a(1)+nj(1)-1;
    for i = 2:1+J
        a(i)=a(i-1)+nj(i-1); 
        nj(i) = nj(i-1)/2; 
        b(i) = a(i)+nj(i)-1; 
    end

end
