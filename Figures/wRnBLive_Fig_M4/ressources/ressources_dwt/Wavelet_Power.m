
function [Pw,logPw] = Wavelet_Power(wData,J)
    Pw = [];
    logPw = [];
    N    = length(wData);
    Jmax = nextpow2(N);
    if J<Jmax
    for j = 1:J
        dj(j).js = [1+N/2^j:N/2^(j-1)];
        dj(j).nj = numel(dj(j).js);
    end
    for j = 1:J
        Pw(J-j+1) = sum((wData(dj(j).js)).^2);
        logPw(J-j+1) = log(sum((wData(dj(j).js)).^2) / dj(j).nj);
    end
    end
end