function GaussM = Best_Betas_Gaussian_fit(betas)
AIC = 10000; OK = 1; n = 1;
GaussM = Betas_gaussian_fit(betas,n);
n = n+1;
while OK
    Gauss2 = Betas_gaussian_fit(betas,n);
    if Gauss2.AIC < AIC
        GaussM = Gauss2;
        AIC = Gauss2.AIC;
        n = 1+1;
    else
        OK = 0;
    end
end
end


function Gauss2 = Betas_gaussian_fit(betas,n)
% X: column of betas
% n: number of gaussians
warning('off');
G = fitgmdist(betas,n);
    k = G.NumComponents;
    m = G.mu;
    s = G.Sigma;
    p = G.ComponentProportion;
    Gauss2.AIC = G.AIC;
    Gauss2.prop = p;
    Gauss2.mu = m;
Gauss2.x = (min(betas)-0.1):0.01:(max(betas)+0.1);
Gauss2.y = zeros(1,numel(Gauss2.x));
for u = 1:k
    a = (Gauss2.x-m(u)).^2 /s(u);
    b = p(u) * 1/sqrt(2*pi*s(u)) * exp(-0.5*a);
    Gauss2.y = Gauss2.y + b;
    Gauss2.max(u) = 1.05*max(b);
end
for u = 1:k
    a = find( abs(Gauss2.x-m(u)) < 0.015,1,'first');
    b = Gauss2.y(a);
    Gauss2.max(u) = b+0.1;
end

end