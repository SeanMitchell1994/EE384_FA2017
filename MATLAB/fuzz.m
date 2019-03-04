function [y_t] = fuzz(f_t,gain)
% Distortion based on an exponential function
% x -input
% gain -amount of distortion, 
% mix -mix of original and distorted sound 
% 1=only distorted
mix = 0.1;
q = f_t./abs(f_t);
y_t = q.*(1-exp(gain*(q.*f_t)));
y_t = mix*y_t+(1-mix)*f_t;
end


