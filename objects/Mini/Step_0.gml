event_inherited();

var _gimmick = hit_jump();

// reset walljump stats
if (meeting_solid(x, y + sign(grv))) {
	walljump_hsp = walljump_hsp_og;
	walljump_vsp = walljump_vsp_og;
	dash_vsp = dash_vsp_og;
}

if (can_gimmick and _gimmick) {
	if (BeNoisy()) {
		audio_play_sound(sfx_Dash,10,0);
	}
	
	hsp = 17.5 * dash_direction();

	vsp = dash_vsp * image_yscale;
	done_gimmick = true;
	can_gimmick = false;
}

if (done_gimmick) {
	sprite_index = Mini_Dash;
}

var input_sign = hit_right() - hit_left();

if (meeting_solid(x + input_sign, y) and done_gimmick and hit_jump()) {
	
	vsp = walljump_vsp * sign(grv);
	hsp = walljump_hsp * input_sign;
	
	if (walljump_vsp < walljump_vsp_crit) {
		walljump_vsp += walljump_vdecay;
	}
	
	if (dash_vsp < dash_vsp_crit) {
		dash_vsp += dash_vdecay;
	}	
	
	if (walljump_hsp > walljump_hsp_crit) {
		walljump_hsp += walljump_hdecay;
	}
	
	audio_play_sound(sfx_SparkleJump,10,0);
	
	done_gimmick = false;
	can_gimmick = false;
}