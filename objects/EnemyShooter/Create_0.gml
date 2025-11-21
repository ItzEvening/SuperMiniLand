event_inherited();

killable = false;
obey_gravity = false;
go_attack = true;
attacking = false;
attack_length = 4/8;

// to be overwritten
idle_sprite = sEnemyShooter;
attack_sprite = sEnemyShooter;
projectile = Projectile_Arrow_Blue;

decide_attack = function() {
	go_attack = true;
}

attack_timer = time_source_create(time_source_global, 3, time_source_units_seconds, decide_attack);

expire_attack = function() {
	// go_attack = false;
	var _arrow = instance_create_layer(x, y + 7, layer, projectile);
	
	if (Player.x > x) {
		_arrow.trajectory_direction = 0;
		_arrow.image_xscale = -1;
	}
	
	_arrow.trajectory_speed = arrow_speed;
	
	attacking = false;
	time_source_start(attack_timer);
}

expire_timer = time_source_create(time_source_global, attack_length, time_source_units_seconds, expire_attack)