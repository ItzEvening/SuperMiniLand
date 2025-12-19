event_inherited();

if (!grounded and place_meeting(x, y + sign(grv), ground_tiles)) {
	grounded = true;
	audio_play_sound(sfx_Thud, 10, false);
	global.lo.send(BIG_THUD,);
}