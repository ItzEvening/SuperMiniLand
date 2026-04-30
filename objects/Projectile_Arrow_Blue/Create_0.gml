trajectory_direction = pi;
trajectory_speed = 4;

expire = function() {
	sprite_index = Hazard_Arrow_Blue_Burn;
}

expire_timer = time_source_create(time_source_game, 4, time_source_units_seconds, expire);
time_source_start(expire_timer);