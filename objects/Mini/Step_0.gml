event_inherited();

var _gimmick = hit_jump();

if (can_gimmick and _gimmick) {
	if (BeNoisy()) {
		audio_play_sound(sfx_Dash,10,0);
	}
	
	hsp = 6 * image_xscale;
	flysp = 8;
	walksp = 8;
	vsp = -3.5 * image_yscale;
	//sprite_index = Mini_Dash;
	done_gimmick = true;
	can_gimmick = false;
	
	dash_time++;
}

else if (done_gimmick and dash_time <= dash_time_max) {
	hsp = calculate_dash_speed() * image_xscale;
	dash_time++;
}

else if (!can_gimmick and !done_gimmick) {
	flysp = 5;
	walksp = 5;
	dash_time = 0;
}

if (done_gimmick) {
	sprite_index = Mini_Dash;
}