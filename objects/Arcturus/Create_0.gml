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
idle = Arcturus_Idle;
idle_impatient = Arcturus_Idle_Full;
fall = Arcturus_Jump_Fall;
run = Arcturus_Run;
floating = Arcturus_Float;

// small
hp_default = 2;
hp = hp_default;

character_specific_animations = function(_midair) {
	var _gimmick = keyboard_check(vk_space) or keyboard_check(ord("W"));
	var _norm_g = vsp > 2 and sign(grv) == 1;
	var _rev_g = vsp < -2 and sign(grv) == -1;
	
	if (_gimmick and (_norm_g or _rev_g)) {
		
		anim = floating;
		anim_speed = 1;
		anim_frame = -1;
	}
}

screwed = function() {
	floating = Arcturus_Float_Help;
	if (GetSave(SV_EDGE_ARC)) {
		floating = Ercturus_Float_Help;
	}
}
reset_animations = function() {
	
	if (GetSave(SV_EDGE_ARC)) {
		idle = Ercturus_Idle;
		idle_impatient = Ercturus_Idle_Full;
		fall = Ercturus_Jump_Fall;
		run = Ercturus_Run;
		floating = Ercturus_Float;
	} else {
		idle = Arcturus_Idle;
		idle_impatient = Arcturus_Idle_Full;
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