// You can write your code in this editor
event_inherited();

//// physics properties
walksp = 3.2;
walkstr = 0.1;
air_resistance = 0.3;
frict = 0.07;
sustain_length = 0.4;
jump_resist = 0.44;

// sprites
idle = Arcturus_Idle_Full;
fall = Arcturus_Jump_Fall;
run = Arcturus_Run;
floating = Arcturus_Float;

// small
hp_default = 2;
hp = hp_default;

screwed = function() {
	floating = Arcturus_Float_Help;
}
reset_animations = function() {
	floating = Arcturus_Float;
}

global.lo.add(self, ARTY_OHNO, screwed);