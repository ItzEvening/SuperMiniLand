event_inherited();

var _gimmick = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"));
var _midair = !meeting_solid(x, y + 1);

// to inform that the player touched ground after boost
if (!_midair and boosted) {
	boosted = false;
}

// red gem gui
if (_gimmick and can_gimmick) {
	coinsFont.red_alpha = 1;
}

if (can_gimmick and _gimmick and boost > 0) {
	// hsp = 17.5 * image_xscale;
	audio_play_sound(sfx_SparkleJump,10,0);
	vsp = -8 * sign(grv);
	boost--;
	coins--;
	
	
	done_gimmick = true;
	can_gimmick = false;
	boosted = true;
	
	forcefield = instance_create_layer(x, y, layer, o_Forcefield);
}

if (can_gimmick and _gimmick and boost == 0) {
	// hsp = 17.5 * image_xscale;
	audio_play_sound(sfx_Jump2,10,0);
	vsp = -5 * sign(grv);
	
	
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
	walksp = 6.5;
	air_resistance = 0.3
}