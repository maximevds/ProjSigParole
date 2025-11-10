function bruit = generer_bruits(s, rsb_dB)
    Ps = mean(s.^2);
    Pb = Ps / (10^(rsb_dB/10));
    bruit = sqrt(Pb) * randn(size(s));
end

%[appendix]{"version":"1.0"}
%---
