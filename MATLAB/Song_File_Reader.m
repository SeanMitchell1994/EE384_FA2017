function [song] = Song_File_Reader()
% Reads notes in from song file
song_file = uigetfile('*.song');
delimiterIn = ',';
fprintf('Reading file %s\n',fullfile(song_file));
notes = importdata(song_file,delimiterIn)

% Returns an array of frequencies coresponding to the notes
for i = 1:length(notes)
    song = Note_Parser(notes{i});
end
end