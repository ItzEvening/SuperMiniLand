event_inherited();

var _gimmick = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"));

if (!done_gimmick and _gimmick) {
	hsp = 20 * image_xscale;
	sprite_index = Mini_Dash;
	done_gimmick = true;
}