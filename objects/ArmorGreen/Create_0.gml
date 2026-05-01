explode = function() {
	spawner.summoned = false;
	instance_create_layer(x, y + 16, layer, GreenExplosion);
	instance_destroy();
}


detonate = function() {
	audio_play_sound(sfx_ArmorDetonate, 10, false);
	image_index = 1;	
	detonating = true;
	time_source_start(explode_timer);
}

detonate_timer = time_source_create(time_source_game, random_range(1, 4), time_source_units_seconds, detonate);
explode_timer = time_source_create(time_source_game, 1.3, time_source_units_seconds, explode);
detonating = false;
spawner = noone;

hsp = 8;
midpoint = (left_border + right_border) / 2;
radius = (right_border - left_border) / 2;
fade = 0.3;
segment = radius * (1 - fade);
shake = 2;

spawn_alpha = 0;
spawn_time = 3;