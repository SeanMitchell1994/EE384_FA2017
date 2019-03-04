function [y_t] = tremolo(f_t,f_x)
fs = 8500;
index = 1:length(f_t);
alpha = 0.5;
trem = (1 + alpha*sin(2*pi*index*(f_x/fs)));
y_t = trem.*f_t;
end

