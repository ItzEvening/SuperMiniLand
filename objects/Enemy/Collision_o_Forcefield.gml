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
	
	if (score_giver) {
		global.score += 100;
	}
	
	time_source_start(death_timer);
	
	// boing the player
	var _collding_forcefield = instance_place(x, y, o_Forcefield);
	if (_collding_forcefield != noone) {
		_collding_forcefield.bounce_function(self);
	}
}