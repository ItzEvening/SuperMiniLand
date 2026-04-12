event_inherited();

walljump_hsp = -12;
walljump_hsp_og = walljump_hsp;
walljump_hsp_crit = -22;
walljump_hdecay = -0.5;

walljump_vsp = -6;
walljump_vsp_og = walljump_vsp;
walljump_vsp_crit = 0;
walljump_vdecay = 1;

walljumping = false;

dash_vsp = -3.5;
dash_vsp_og = dash_vsp;
dash_vsp_crit = -1;
dash_vdecay = 0.5;

jump_acceleration = -0.21;
jump_init = -1.4;
jump_time_max = 15;

walljump_expire = time_source_create(time_source_global, 0.6, time_source_units_seconds, function() {
	walljumping = false;
});

character_specific_animations = function(_midair)
{
	// If walljumping
	if (walljumping and sign(vsp) == -1 * sign(grv)) {
		anim_speed = 1;
		anim_frame = -1;
		anim = Mini_Walljump;
	}
	
	// If dashing
	else if (_midair and done_gimmick) {
		anim_speed = 1;
		anim_frame = -1;
		anim = Mini_Dash;
	}
}

dash_direction = function() {
	
	var input = hit_right() - hit_left();
	
	if (input != 0) {
		return input;
	}
	
	if (hsp != 0) {
		return sign(hsp);
	}
	
	
	return image_xscale;
}