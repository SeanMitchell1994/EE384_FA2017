function [y] = Stereo_Panning()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
t = 0:0.01:15;
monox = sin(2*pi*30*t);
initial_angle = -40; %in degrees
final_angle = 40;    %in degrees
segments = 32;
angle_increment = (initial_angle - final_angle)/segments * pi / 180;
                % in radians
lenseg = floor(length(monox)/segments) - 1;
pointer = 1;
angle = initial_angle * pi / 180; %in radians

y=[[];[]];

for i=1:segments
 A =[cos(angle), sin(angle); -sin(angle), cos(angle)];
 stereox = [monox(pointer:pointer+lenseg); monox(pointer:pointer+lenseg)];
 y = [y, A * stereox];
 angle = angle + angle_increment; 
 pointer = pointer + lenseg;
end;


end

