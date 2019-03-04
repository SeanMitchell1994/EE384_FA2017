function [] = Frontend()

while true
    str = input('Input:','s');
    if str == 'q'
       disp('Exiting...')
       break 
    end
    Note_Parser(str)
end

end

