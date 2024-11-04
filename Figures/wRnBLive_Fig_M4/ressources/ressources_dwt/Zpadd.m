function [signal_out] = Zpadd(signal_in)
Nt = 2^nextpow2(length(signal_in));
offset = round(0.5*(Nt-length(signal_in)));
signal_out = zeros(1,Nt);
signal_out(offset:offset+length(signal_in)-1) = signal_in;
end

