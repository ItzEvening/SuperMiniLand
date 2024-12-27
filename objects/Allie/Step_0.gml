event_inherited();

var _gimmick = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"));

if (can_gimmick and _gimmick) {
	// hsp = 17.5 * image_xscale;
	vsp = 20;
	
	
	
	done_gimmick = true;
	can_gimmick = false;
}