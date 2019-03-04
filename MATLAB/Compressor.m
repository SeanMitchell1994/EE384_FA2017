function [y] = Compressor(x,comp)
% Compressor/expander
% comp - compression: 0>comp>-1, expansion: 0<comp<1
% a     - filter parameter <1
fs = 44100;
a = 0.5;
h=filter([(1-a)^2],[1.0000 -2*a a^2],abs(x));
h=h/max(h);
h=h.^comp;
y=x.*h;
y=y*max(abs(x))/max(abs(y));

L = length(x);
n = pow2(nextpow2(L));
y_dft = fft(x,n);
y_s = fftshift(y_dft);
f = (-n/2:n/2-1) * (fs/n);

figure,
freqz([(1-a)^2],[1.0000 -2*a a^2],n,fs)
grid on
title('Fitler Frequency Reponse','FontWeight','Normal')

end

