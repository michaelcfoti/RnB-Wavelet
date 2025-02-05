function kappa = K(b,a)
% Compute Kappa parameter 
% 
% INPUTS:
%     - b: beta value 
%
%     - a:  alpha value
%
% OUTPUTS:
%     - kappa: Wavelet basis change between alpha and beta

kappa = (4*pi)^b;
u = 2^(a+1)-1;
v = 2^(a+b+1)-1;
w = zeta(a+1)/zeta(a+b+1);
kappa = kappa*u/v*w;
end
