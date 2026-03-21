event_inherited();

jump_acceleration = -0.21;
jump_init = -1.4;
jump_time_max = 15;

dash_time = 0;
dash_time_max = 10;
dash_sp_init = 6;
dash_acc = 0.2;

character_specific_animations = function(_midair)
{
	// If dashing
	if (_midair and done_gimmick) {
		anim_speed = 1;
		anim_frame = -1;
		anim = Mini_Dash;
	}
}

calculate_dash_speed = function() {
	return dash_sp_init + dash_acc * dash_time;
}