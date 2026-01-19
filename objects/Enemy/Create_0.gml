event_inherited();

spr_dead = GarDead;
sfx_hurt = undefined;
sfx_dead = EnemyDefeat;
killable = true;
hostile = true;
collide_on_death = true;
score_giver = false;
rot = true;
hp = 1;
offense = 1;

expire_invinsibility = function() {
	killable = true;
	hostile = true;
}

hurt = function() {
	hp--;
	
	if (hp <= 0) {
		die();
		return;
	}
	
	// make invincible
	killable = false;
	hostile = false;
	time_source_start(invincibility_timer);
	
	if (!is_undefined(sfx_hurt)) {
		audio_play_sound(sfx_hurt, 10, 0);
	}
}

die = function() {
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
}

decompose = function() {
	if (rot) {
		instance_destroy();
	}
}

dead = false;
death_timer = time_source_create(time_source_game, 1, time_source_units_seconds, decompose);
invincibility_timer = time_source_create(time_source_game, 1.5, time_source_units_seconds, expire_invinsibility);


good_to_kill = function(_player) {
	return _player.y < bbox_top and 
	!dead and 
	_player.vsp > -3 and 
	killable and
	!place_meeting(x, y, o_Forcefield);
}