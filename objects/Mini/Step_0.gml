event_inherited();

var _gimmick = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"));

if (!done_gimmick and _gimmick) {
	audio_play_sound(sfx_Dash,10,0);
	hsp = 17.5 * image_xscale;
	vsp = -3.5 * image_yscale;
	//sprite_index = Mini_Dash;
	done_gimmick = true;
}