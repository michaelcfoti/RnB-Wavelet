function wr = filteArrhythmicComponent(w, a, b, alpha, alpha0, J)

    wr = zeros(size(w));
    for js = 1:J
        aWj = w(a(js):b(js));
        wr(a(js):b(js)) = K(alpha, alpha0) * 2^(-js * alpha) * aWj;
    end

end