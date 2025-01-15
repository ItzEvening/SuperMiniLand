if (!dead and killable) {
	sprite_index = spr_dead;
	audio_play_sound(sfx_dead, 10, 0);
	dead = true;
	
	obey_gravity = true;
		
	if (collide_on_death) {
		obey_collisions = true;
	}
	
	if (path_index != -1) {
		path_end();
	}
	
	time_source_start(death_timer);
	

}