function [Pxx, f] = Mon_Daniell(x, NFFT, Fe, L)
% Périodogramme de Daniell : lissage du périodogramme simple
    X = fft(x, NFFT);
    Pxx = (abs(X).^2) / (Fe * NFFT);
    Pxx = Pxx(1:NFFT/2+1);
    f = (0:NFFT/2) * Fe / NFFT;

    % Lissage (moyenne mobile)
    h = ones(1, L) / L;
    Pxx = conv(Pxx, h, 'same');
end

