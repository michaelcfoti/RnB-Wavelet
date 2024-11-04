
function scaling = comp_scal(s500,analysisfilter,synthesisfilter,J)
    w500 = FFTwaveletanalysis1D(s500,analysisfilter,J);
    k = length(w500)/2^J;
    w500(1:end-k) = 0;
    scaling = FFTwaveletsynthesis1D(w500,synthesisfilter,J);
end