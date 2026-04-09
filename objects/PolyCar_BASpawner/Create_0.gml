num_cars = 6;
num_cars_hard = 12;
rep = 0;
special = 4;
special_hard = 10;
overclocked = false;

carsp = 4;
carsp_hard = 8;

spawn = function() {
	var car = instance_create_layer(x, y, layer, PolyCar_Boss);
	var spec = special;
	var spd = carsp;
	
	if (overclocked) {
		spec = special_hard;
		spd = carsp_hard;
	}
	
	if (rep == spec) {
		car.trigger_fly_end = true;
	}
	
	if (car != noone) {
		car.walksp = spd;
	}
	
	rep++;
}

spawn_timer = time_source_create(time_source_global, 1.5, time_source_units_seconds, spawn, [], num_cars);
spawn_timer_hard = time_source_create(time_source_global, 1, time_source_units_seconds, spawn, [], num_cars_hard);

trigger = function(ovrclk) {
	rep = 0;
	overclocked = ovrclk;
	audio_play_sound(sfx_Car_Horn_2, 10, false);
	
	if(overclocked) {
		time_source_start(spawn_timer_hard);
	}
	else {
		time_source_start(spawn_timer);
	}
	
	
}