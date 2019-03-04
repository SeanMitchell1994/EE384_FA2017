function [mix] = Effect_Preparser(id,mod,soundwave)
    if (id == 1)
        mix = soundwave;
    elseif (id == 2)
        mix = tremolo(soundwave,mod);
    elseif (id == 3)
        mix = fuzz(soundwave,mod);   
    elseif (id == 4)
        mix = Overdrive(soundwave);  
    elseif (id == 5)
        mix = Compressor(soundwave,mod);  
    end
end

