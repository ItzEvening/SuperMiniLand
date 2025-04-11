event_inherited();

var _gimmick = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"));
var _underwater = place_meeting(x,y,water_tiles);

if (can_gimmick and _gimmick){
	audio_play_sound(sfx_Jump2,10,0);
	if (_underwater) {
		vsp = jump_strength_water;
	}
	else {
		vsp = jump_strength;
	}
	
	vsp *= 2.2 * sign(grv);
	
	done_gimmick = true;
	can_gimmick = false;
}