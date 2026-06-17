event_inherited();
lift_speed = 1;
one_use = true;
max_acceptable_y = infinity;

respawn_lift = function() {
	instance_create_layer(x, y_max, layer, Sanctuary_Lift, {
		init_direction : init_direction,
		y_min : y_min,
		y_max : y_max,
	});
	
	instance_destroy();
	
	if (tiktok != undefined) {
		audio_stop_sound(tiktok);
	}
}

global.lo.add(self, RESPAWN_CC6_LIFT, respawn_lift);