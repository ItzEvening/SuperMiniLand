event_inherited();

var _gimmick = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"));

if (can_gimmick and _gimmick) {
	// hsp = 17.5 * image_xscale;
	audio_play_sound(Drill,10,0);
	hsp = 0;
	vsp = 20 * sign(grv);
	
	
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