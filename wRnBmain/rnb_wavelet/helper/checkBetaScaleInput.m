function betaScales = checkBetaScaleInput(s, betaScales)

    [~, nSamples] = size(s);
    
    maxScales = nextpow2(nSamples);
    
    if betaScales(2) > maxScales
        fprintf('\nNumber of wavelet scales set for slope computation (betaScales = %d) is invalid.\n', betaScales(2));
        betaScales(2) = maxScales - 2;
        fprintf(' betaScales adjusted to: %d \n', betaScales(2));
    end
end
