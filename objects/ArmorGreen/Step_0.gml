if (!detonating) {
	var delta_x = min(abs(Player.x - x), hsp);
	var new_x = x + delta_x * sign(Player.x - x);
	x = clamp(new_x, left_border, right_border);
}


var dist = distance_to_object(Player);

if (dist <= 16 and time_source_get_state(detonate_timer) != time_source_state_active and !detonating) {
	time_source_start(detonate_timer);
} 
else if (dist > 16 and time_source_get_state(detonate_timer) == time_source_state_active) {
	time_source_stop(detonate_timer);
}

spawn_alpha = min(1, spawn_alpha + delta_time / (3 * 1000000));