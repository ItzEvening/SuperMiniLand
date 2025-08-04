event_inherited();

var _gimmick = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"));

if (can_gimmick and _gimmick) {
	if (BeNoisy()) {
		audio_play_sound(sfx_Dash,10,0);
	}
	
	hsp = 17.5 * image_xscale;
	vsp = -3.5 * image_yscale;
	//sprite_index = Mini_Dash;
	done_gimmick = true;
	can_gimmick = false;
}

if (done_gimmick) {
	sprite_index = Mini_Dash;
}