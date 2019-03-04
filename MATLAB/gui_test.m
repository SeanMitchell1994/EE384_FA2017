function [] = gui_test()
% Default Values
t_a = 5;         % duration of attack phase
t_d = 3;       % duration of delay phase
t_s = 2;         % duration of sustain phase
t_r = 5;         % duration of release phase
effect_1 = 1;
effect_1_mod = 0;

effect_2 = 1;
effect_2_mod = 0;

effect_3 = 1;
effect_3_mod = 0;
octave = 2^0;


% Note Frequencies (Hz)
C = 16.35;
C_Sharp = 17.32;
D = 18.35;
E_Flat = 19.45;

E = 20.60;
F = 21.83;
F_Sharp = 23.12;
G = 24.50;

G_Sharp = 25.96;
A = 27.50;
B_Flat = 29.14;
B = 30.87;

%  Create and then hide the UI as it is being constructed.
f = figure('Visible','off','Position',[360,500,450,285]);

% Note buttons
button_c = uicontrol('Style','pushbutton','String','C','Position',[215,220,30,25],'Callback',@C_Button_Callback);
button_c_sharp = uicontrol('Style','pushbutton','String','C#','Position',[315,190,30,25],'Callback',@C_Sharp_Button_Callback);
button_d = uicontrol('Style','pushbutton','String','D','Position',[315,160,30,25],'Callback',@D_Button_Callback);
button_e_flat = uicontrol('Style','pushbutton','String','Eb','Position',[315,130,30,25],'Callback',@E_Flat_Button_Callback);

button_e = uicontrol('Style','pushbutton','String','E','Position',[265,220,30,25],'Callback',@E_Button_Callback);
button_f_sharp = uicontrol('Style','pushbutton','String','F#','Position',[365,190,30,25],'Callback',@F_Sharp_Button_Callback);
button_f = uicontrol('Style','pushbutton','String','F','Position',[365,160,30,25],'Callback',@F_Button_Callback);
button_g = uicontrol('Style','pushbutton','String','G','Position',[365,130,30,25],'Callback',@G_Button_Callback);

button_g_sharp = uicontrol('Style','pushbutton','String','G#','Position',[315,220,30,25],'Callback',@G_Sharp_Button_Callback);
button_a = uicontrol('Style','pushbutton','String','A','Position',[415,190,30,25],'Callback',@A_Button_Callback);
button_b_flat = uicontrol('Style','pushbutton','String','Bb','Position',[415,160,30,25],'Callback',@B_Flat_Button_Callback);
button_b = uicontrol('Style','pushbutton','String','B','Position',[415,130,30,25],'Callback',@B_Button_Callback);

% Effects selectors
eff_label = uicontrol('style','text','String','Effects','Position', [265,100,50,25]);
effect_select_1 = uicontrol('Style', 'popup','String', {'None','Tremolo','Fuzz','Overdrive','Compressor'},'Position', [265,80,70,25],'Callback',@Effect1_Callback);  
effect_select_2 = uicontrol('Style', 'popup','String', {'None','Tremolo','Fuzz','Overdrive','Compressor'},'Position', [265,50,70,25],'Callback',@Effect2_Callback);
effect_select_3 = uicontrol('Style', 'popup','String', {'None','Tremolo','Fuzz','Overdrive','Compressor'},'Position', [265,20,70,25],'Callback',@Effect3_Callback);

% Effect mod selectors
effect1_mod_button = uicontrol('Style','edit','String','0','Position',[350,80,70,25],'Callback',@Effect1_Mod_Callback);
effect2_mod_button = uicontrol('Style','edit','String','0','Position',[350,50,70,25],'Callback',@Effect2_Mod_Callback);
effect3_mod_button = uicontrol('Style','edit','String','0','Position',[350,20,70,25],'Callback',@Effect3_Mod_Callback);

% Octave selector
oct_label = uicontrol('style','text','String','Octave','Position', [265,250,50,25]);
octave_select = uicontrol('Style', 'popup','String', {0,1,2,3,4,5,6,7,8},'Position', [315,250,30,25],'Callback',@Octave_Callback);

% Attack slider
slider_attack = uicontrol('Style', 'slider','Min',0,'Max',20,'Value',5,'Position', [50 20 20 10],'Callback',@Attack_Slider_Callback); 
text_attack = uicontrol('Style','text','Position',[50 30 20 10],'String','Attack');

% Decay slider
slider_decay = uicontrol('Style', 'slider','Min',0,'Max',20,'Value',5,'Position', [75 20 20 10],'Callback', @Decay_Slider_Callback); 
text_decay = uicontrol('Style','text','Position',[75 30 20 10],'String','Decay');

% Sustain slider
slider_sustain = uicontrol('Style', 'slider','Min',0,'Max',20,'Value',5,'Position', [100 20 20 10],'Callback', @Sustain_Slider_Callback); 
text_sustain = uicontrol('Style','text','Position',[100 30 20 10],'String','Sustain');

% Release slider
slider_release = uicontrol('Style', 'slider','Min',0,'Max',20,'Value',5,'Position', [125 20 20 10],'Callback', @Release_Slider_Callback); 
text_release = uicontrol('Style','text','Position',[125 30 20 10],'String','Release');

ha = axes('Units','pixels','Position',[50,60,200,185]);
align([button_c,button_c_sharp,button_d,button_e_flat,oct_label],'Center','None');
align([button_e,button_f_sharp,button_f,button_g],'Center','None');
align([button_g_sharp,button_a,button_b_flat,button_b],'Center','None');

% Initialize the UI.
% Change units to normalized so components resize automatically.
f.Units = 'normalized';
ha.Units = 'normalized';
button_c.Units = 'normalized'; button_c_sharp.Units = 'normalized'; button_d.Units = 'normalized'; button_e_flat.Units = 'normalized';
button_e.Units = 'normalized'; button_f_sharp.Units = 'normalized'; button_f.Units = 'normalized'; button_g.Units = 'normalized';
button_g_sharp.Units = 'normalized'; button_a.Units = 'normalized'; button_b_flat.Units = 'normalized'; button_b.Units = 'normalized';
slider_attack.Units = 'normalized';slider_decay.Units = 'normalized'; slider_sustain.Units = 'normalized'; slider_release.Units = 'normalized';
text_attack.Units = 'normalized'; text_decay.Units = 'normalized'; text_sustain.Units = 'normalized'; text_release.Units = 'normalized';
effect_select_1.Units = 'normalized'; effect_select_2.Units = 'normalized'; effect_select_3.Units = 'normalized';eff_label.Units = 'normalized';
octave_select.Units = 'normalized';oct_label.Units = 'normalized';
effect1_mod_button.Units = 'normalized'; effect2_mod_button.Units = 'normalized'; effect3_mod_button.Units = 'normalized';

% Assign the a name to appear in the window title.
f.Name = 'MATLAB Digital Synthesizer';

% Move the window to the center of the screen.
movegui(f,'center')

% Make the window visible.
f.Visible = 'on';

% Push button callbacks
function C_Button_Callback(source,eventdata) 
% Display surf plot of the currently selected data.
    f_t = ADSR_Envelope(C, octave, t_a, t_d, t_s, t_r, effect_1, effect_1_mod, effect_2, effect_2_mod, effect_3, effect_3_mod);
    soundsc(f_t);
end

function C_Sharp_Button_Callback(source,eventdata) 

    f_t = ADSR_Envelope(C_Sharp, octave, t_a, t_d, t_s, t_r, effect_1, effect_1_mod, effect_2, effect_2_mod, effect_3, effect_3_mod);
    soundsc(f_t);
end

function D_Button_Callback(source,eventdata) 
% Display mesh plot of the currently selected data.
   f_t = ADSR_Envelope(D, octave, t_a, t_d, t_s, t_r, effect_1, effect_1_mod, effect_2, effect_2_mod, effect_3, effect_3_mod);
   soundsc(f_t);
end

function F_Button_Callback(source,eventdata) 
% Display contour plot of the currently selected data.
   f_t = ADSR_Envelope(F, octave, t_a, t_d, t_s, t_r, effect_1, effect_1_mod, effect_2, effect_2_mod, effect_3, effect_3_mod);
   soundsc(f_t);
end

function F_Sharp_Button_Callback(source,eventdata) 
    f_t = ADSR_Envelope(F_Sharp, octave, t_a, t_d, t_s, t_r, effect_1, effect_1_mod, effect_2, effect_2_mod, effect_3, effect_3_mod);
    soundsc(f_t);
end

function G_Button_Callback(source,eventdata) 
% Display mesh plot of the currently selected data.
   f_t = ADSR_Envelope(G, octave, t_a, t_d, t_s, t_r, effect_1, effect_1_mod, effect_2, effect_2_mod, effect_3, effect_3_mod);
   soundsc(f_t);
end

function G_Sharp_Button_Callback(source,eventdata) 
    f_t = ADSR_Envelope(G_Sharp, octave, t_a, t_d, t_s, t_r, effect_1, effect_1_mod, effect_2, effect_2_mod, effect_3, effect_3_mod);
   soundsc(f_t);
end

function E_Button_Callback(source,eventdata) 
% Display contour plot of the currently selected data.
   f_t = ADSR_Envelope(E, octave, t_a, t_d, t_s, t_r, effect_1, effect_1_mod, effect_2, effect_2_mod, effect_3, effect_3_mod);
   soundsc(f_t);
end

function E_Flat_Button_Callback(source,eventdata) 
    f_t = ADSR_Envelope(E_Flat, octave, t_a, t_d, t_s, t_r, effect_1, effect_1_mod, effect_2, effect_2_mod, effect_3, effect_3_mod);
    soundsc(f_t);
end

function A_Button_Callback(source,eventdata) 
% Display contour plot of the currently selected data.
   f_t = ADSR_Envelope(A, octave, t_a, t_d, t_s, t_r, effect_1, effect_1_mod, effect_2, effect_2_mod, effect_3, effect_3_mod);
   soundsc(f_t);
end

function B_Button_Callback(source,eventdata) 
% Display contour plot of the currently selected data.
   f_t = ADSR_Envelope(B, octave, t_a, t_d, t_s, t_r, effect_1, effect_1_mod, effect_2, effect_2_mod, effect_3, effect_3_mod);
   soundsc(f_t);
end

function B_Flat_Button_Callback(source,eventdata) 
    f_t = ADSR_Envelope(B_Flat, octave, t_a, t_d, t_s, t_r, effect_1, effect_1_mod, effect_2, effect_2_mod, effect_3, effect_3_mod);
    soundsc(f_t);
end

% Slider callbacks
function Attack_Slider_Callback(source,event)
    t_a = source.Value;
end

function Decay_Slider_Callback(source,event)
    t_d = source.Value;
end

function Sustain_Slider_Callback(source,event)
    t_s = source.Value;
end

function Release_Slider_Callback(source,event)
    t_r = source.Value;
end

% Effects dropdown menu callbacks
function Effect1_Callback(source,event)
    effect_1 = source.Value;
end

function Effect1_Mod_Callback(source,event)
    effect_1_mod = str2num(get(effect1_mod_button,'String'));
end

function Effect2_Callback(source,event)
    effect_2 = source.Value;
end

function Effect2_Mod_Callback(source,event)
    effect_2_mod = str2num(get(effect2_mod_button,'String'));
end

function Effect3_Callback(source,event)
    effect_3 = source.Value;
end

function Effect3_Mod_Callback(source,event)
    effect_3_mod = str2num(get(effect3_mod_button,'String'));
end

function Octave_Callback(source,event)
    octave = 2^(source.Value - 1);
end

end