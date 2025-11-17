function [y, f] = Mon_Welch(x, NFFT, Fe, nr)
%nr est le nombre de points qui se chevauchent
%si nr n'est pas défini on fait un recouvrement de 50%
% Ensure the input signal is a column vector
    x = x(:);
    if nargin < 4
        nr = floor(NFFT/2);
    end
    window = hamming(NFFT);

    L = length(window);
    step = L - nr;
    nb_segments = floor((length(x) - nr) / step);

    % Initialisation
    periodogrammes = zeros(NFFT, nb_segments);
    for k = 1:nb_segments
        idx_start = (k-1)*step + 1;
        idx_end   = idx_start + L - 1;

        % Extraction + fenêtrage
        x_seg = x(idx_start:idx_end) .* window;

        % FFT
        X_fft = fft(x_seg, NFFT);

        % Périodogramme
        periodogrammes(:, k) = (abs(X_fft).^2) / (Fe * sum(window.^2));
    end
    y = mean(periodogrammes, 2);
    f = (0:NFFT-1) * Fe / NFFT;
end
