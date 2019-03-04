function [freq] = Note_Parser(note)

% Note Frequencies (Hz)

%C = 16.35;
%C_Sharp = 17.32;
%D = 18.35;
%E_Flat = 19.45;
%E = 20.60;
%F = 21.83;
%F_Sharp = 23.12;
%G = 24.50;
%G_Sharp = 25.96;
%A = 27.50;
%B_Flat = 29.14;
%B = 30.87;

switch char(note)
    case 'C'
        freq = 16.35;
    case 'C#'
        freq = 17.32;
    case 'D'
        freq = 18.35;
    case 'D#'
        freq = 19.45;
    case 'Eb'
        freq = 19.45;
    case 'E'
        freq = 20.60;
    case 'F'
        freq = 21.83;
    case 'F#' 
        freq = 23.12;
    case 'A'
        freq = 27.50;
    case 'Bb'
        freq = 29.14;
    case 'B'
        freq = 30.87;
    otherwise
        freq = 0;
end
end