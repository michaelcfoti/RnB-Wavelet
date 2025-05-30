function J = checkJInput(s, J)


[~,nSamples]=size(s);

maxScales  = nextpow2(nSamples);

if J > maxScales
    fprintf('\n Number of wavelet scales (J = %d)  is invalid.',J);
    J = maxScales - 2;
    fprintf(' J adusted to : %d \n', J);
end



end
