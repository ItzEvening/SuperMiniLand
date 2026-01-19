event_inherited();

character_specific_animations = function(_midair)
{
	// If dashing
	if (_midair and done_gimmick) {
		anim_speed = 1;
		anim_frame = -1;
		anim = Mini_Dash;
	}
}