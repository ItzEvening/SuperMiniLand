enabled = true;
reenable = function() {
	image_alpha = 1.0;
	sprite_index = Gem_Infinite;
	enabled = true;
}

timer = time_source_create(time_source_global, 5, time_source_units_seconds, reenable);
disable = function() {	
	image_alpha = 0.4;
	enabled = false;
	sprite_index = Gem_Infinite_Used;
	time_source_start(timer);
}