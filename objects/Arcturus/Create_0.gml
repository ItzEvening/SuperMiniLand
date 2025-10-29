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
	if (GetSave(SV_EDGE_ARC)) {
		floating = Ercturus_Float_Help;
	}
}
reset_animations = function() {
	
	if (GetSave(SV_EDGE_ARC)) {
		idle = Ercturus_Idle_Full;
		fall = Ercturus_Jump_Fall;
		run = Ercturus_Run;
		floating = Ercturus_Float;
	} else {
		idle = Arcturus_Idle_Full;
		fall = Arcturus_Jump_Fall;
		run = Arcturus_Run;
		floating = Arcturus_Float;
	}
}

change_arty = function(_a) {
	reset_animations();
}

reset_animations();
global.lo.add(self, ARTY_OHNO, screwed);
global.lo.add(self, ARTY_CHANGE, reset_animations);