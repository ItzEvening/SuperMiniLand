event_inherited();

var _gimmick = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"));
var _midair = !meeting_solid(x, y + sign(grv));

// to inform that the player touched ground after boost
if (!_midair and boosted) {
	boosted = false;
	global.lo.send(TOGGLE_SHAKE, false);
}

// red gem gui
if (_gimmick and can_gimmick) {
	coinsFont.red_alpha = 1;
}

if (can_gimmick and _gimmick and boost > 0) {
	// hsp = 17.5 * image_xscale;
	audio_play_sound(sfx_Dash,10,0);
	hsp = 30 * image_xscale;
	vsp = -3.5;
	walksp = 15;
	boost--;
	coins--;
	
	
	done_gimmick = true;
	can_gimmick = false;
	boosted = true;
	
	forcefield = instance_create_layer(x, y, layer, o_Forcefield);
	global.lo.send(TOGGLE_SHAKE, true);
}

if (can_gimmick and _gimmick and boost == 0) {
	// hsp = 17.5 * image_xscale;
	audio_play_sound(sfx_Drone_Defeat,10,0);
	hsp = 0 * image_xscale;
	vsp = -0;
	
	
	done_gimmick = true;
	can_gimmick = false;
	
	forcefield = instance_create_layer(x, y, layer, o_Forcefield);
}

if (done_gimmick) {
	forcefield.x = x;
	forcefield.y = y;
}
else if (forcefield != noone) {
	instance_destroy(forcefield);
	forcefield = noone;
}

if (can_gimmick) {
	walksp = 9.5;
}