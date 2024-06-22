function kappa = K(b,a)

% INPUTS:
%     - b: beta value 
%
%     - a:  alpha value
%
% OUTPUTS:
%     - Kappa: Parameter necessary for wavelet synthesis

kappa = (4*pi)^b;
u = 2^(a+1)-1;
v = 2^(a+b+1)-1;
w = zeta(a+1)/zeta(a+b+1);
kappa = kappa*u/v*w;
end
