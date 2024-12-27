event_inherited();

var _gimmick = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"));

if (can_gimmick and _gimmick) {
	// hsp = 17.5 * image_xscale;
	hsp = 0;
	vsp = 20;
	
	
	
	done_gimmick = true;
	can_gimmick = false;
}

if (done_gimmick) {
	sprite_index = Allie_Stomp;
}