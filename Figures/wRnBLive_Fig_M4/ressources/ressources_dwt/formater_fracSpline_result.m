

function wData = formater_fracSpline_result(w,wavelet)
% flip initial
wData = fliplr(w);
N = length(w);
J = length(wavelet.scales_j);
for j = 1:J
    wData(N/2^j+1:N/2^(j-1)) = fliplr(wData(N/2^j+1:N/2^(j-1)));
end

end