function [adsr_out] = ADSR_Envelope(note, octave, t_a, t_d, t_s, t_r, effect_1, effect_1_mod, effect_2, effect_2_mod, effect_3, effect_3_mod)
t = 0:0.01:(t_a + t_d + t_s + t_r); %samples
time = t/44100; %time

% Base functions
f_t_a = exp(t-t_a);
f_t_d = exp(t_a-t);
f_t_s = (1/exp(t_d)).*ones(size(t));
f_t_r = (1/exp(t_d)).*exp((t_d + t_a + t_s)-t);

f_oct = note * octave;
wave = sin(2*pi*f_oct*t);

% Zero-ing out the windowing functions
f_t_a(t>=t_a) = 0;

f_t_d(t<(t_a)) = 0;
f_t_d(t>=(t_a + t_d)) = 0;

f_t_s(t<t_a+t_d) = 0;
f_t_s(t>=(t_a + t_d + t_s)) = 0;

f_t_r(t<(t_a + t_d + t_s)) = 0;

% Effects mix
wave = Effect_Preparser(effect_1, effect_1_mod, wave);
wave = Effect_Preparser(effect_2, effect_2_mod, wave);
wave = Effect_Preparser(effect_3, effect_3_mod, wave);

% Creating the soundwave functions
f_t1 = wave .* f_t_a;
f_t2 = wave .* f_t_d;
f_t3 = wave .* f_t_s;  
f_t4 = wave .* f_t_r;

% Summing the soundwave functions into a single function
f_sum = f_t1 + f_t2 + f_t3 + f_t4;
adsr_out = f_sum/max(f_sum); %normalized output

% Plot of the windowing functions + soundwave
%figure,
%plot(time,f_t_a,time,f_t_d,time,f_t_s,time,f_t_r,time,adsr_out);
%legend('Attack','Decay','Sustain','Release','Soundwave');
plot(time,adsr_out);
xlabel('Time (s)');
ylabel('Amplitude');
title('A440 ADSR Envelope');
ylim([-1 1]);
grid on
end