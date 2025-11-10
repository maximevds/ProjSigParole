function y = Mon_Welch(x, NFFT, Fe)
nb_segments = floor(length(x) / NFFT);

x_tronque = x(1 : nb_segments * NFFT);
x_reshaped = reshape(x_tronque, NFFT, nb_segments);

X_fft = fft(x_reshaped, NFFT);

periodogrammes = (abs(X_fft)).^2 / (Fe * NFFT);
y = mean(periodogrammes, 2);

end