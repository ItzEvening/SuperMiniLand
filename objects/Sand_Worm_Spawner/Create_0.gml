ready = false;
hasworm = false;
t = 0;
t_max = 3;

xmin = bbox_left + 16;
xmax = bbox_right - 16;

enemy_layer = layer_get_id("Enemies");
detect_distance = 32 * detect_tile_distance;

next_x = 0;

decide_next_x = function() {
	next_x = random_range(xmin, xmax);
}

spawn_worm = function() {
	if (global.difficulty < 2) {
		return;
	}
	
	var worm = instance_create_layer(next_x, y, enemy_layer, Sand_Worm_SI);
	worm.spawner = self;
	
	ready = false;
	hasworm = true;
	
	decide_next_x();
}

decide_next_x();