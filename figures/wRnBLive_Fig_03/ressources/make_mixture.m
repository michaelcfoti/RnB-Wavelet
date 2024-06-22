function g = make_mixture(Betas,Ngauss,beta_samp)

    if (Ngauss > 3), Ngauss = 2; end
    GG = fitgmdist(Betas',Ngauss,'options',statset('MaxIter',1500','TolFun',1e-5));
    
    % gauss1
    mu1 = GG.mu(1);
    si1 = sqrt(GG.Sigma(1));
    A1 = GG.ComponentProportion(1)/sqrt(2*pi)/si1;
    g1 = A1*exp(-0.5*(beta_samp-mu1).^2/si1^2);
    %gauss2
    mu2 = GG.mu(2);
    si2 = sqrt(GG.Sigma(2));
    A2 = GG.ComponentProportion(2)/sqrt(2*pi)/si2;
    g2 = A2*exp(-0.5*(beta_samp-mu2).^2/si2^2);
    g = g1+g2;
    
    if Ngauss == 3
        mu3 = GG.mu(3);
        si3 = sqrt(GG.Sigma(3));
        A3 = GG.ComponentProportion(3)/sqrt(2*pi)/si3;
        g3 = A3*exp(-0.5*(beta_samp-mu3).^2/si3^2);
        g = g + g3;
    end

end

