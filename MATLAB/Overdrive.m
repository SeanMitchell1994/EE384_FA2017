function [y] = Overdrive(f_t)
N=length(f_t);
y=zeros(1,N); % Preallocate y
th=1/3; % threshold for symmetrical soft clipping by Schetzen Formula
for i=1:1:N,
    if abs(f_t(i))< th, y(i)=2*f_t(i);end;
    if abs(f_t(i))>=th,
        if f_t(i)> 0, y(i)=(3-(2-f_t(i)*3).^2)/3; end;
        if f_t(i)< 0, y(i)=-(3-(2-abs(f_t(i))*3).^2)/3; end;
    end;
    if abs(f_t(i))>2*th,
    if f_t(i)> 0, y(i)=1;end;
    if f_t(i)< 0, y(i)=-1;end;
    end;

end

