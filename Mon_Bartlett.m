function [Pxx, f] = Mon_Bartlett(x, NFFT, Fe)
    N = length(x);
    nb_segments = floor(N / NFFT);
    x = x(1 : nb_segments * NFFT);
    x = reshape(x, NFFT, nb_segments);
    window = rectwin(NFFT);
    somme = 0;

    for k = 1:nb_segments
        segment = x(:, k) .* window;
        X = fft(segment, NFFT);
        somme = somme + (abs(X).^2) / (Fe * sum(window.^2));
    end

    Pxx = somme / nb_segments;
    Pxx = Pxx(1:NFFT/2+1);
    f = (0:NFFT/2) * Fe / NFFT;
end
