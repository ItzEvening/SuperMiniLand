event_inherited();

jump_acceleration = -0.26;
jump_acceleration_water = -0.42;
jump_init = -1.4;
jump_time_max = 15;

character_specific_animations = function(_midair)
{
	// If dashing
	if (_midair and done_gimmick) {
		anim_speed = 1;
		anim_frame = -1;
		anim = Mini_Dash;
	}
}