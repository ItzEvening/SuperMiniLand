if (enable_toggle and global.menu_control) {
	global.bear = !global.bear;
	
	if (!global.bear) {
		audio_play_sound(sfx_Jump, 10, 0);
		image_index = 1;
		Challenge.sprite_index = ChallengeNamey;
	}
	else {
		audio_play_sound(sfx_Jump3, 10, 0);
		image_index = 2;
		Challenge.sprite_index = ChallengeBear;
	}
}