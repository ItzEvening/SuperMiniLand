shader_set(LightMultiply);
shader_set_uniform_f(AmbientLight.u_color, AmbientLight.r, AmbientLight.g, AmbientLight.b, 1);	

var shake = time_source_get_state(attack_timer) == time_source_state_active or go_attack;
if (global.difficulty > 1 and shake) {
	var timeleft = time_source_get_time_remaining(attack_timer);
	var shakefactor = 1 - (timeleft / 15)
	var dx = random_range(-1 * max_dx * shakefactor, max_dx * shakefactor);
	var dy = random_range(-1 * max_dx * shakefactor, max_dx * shakefactor);
	draw_sprite(sprite_index, -1, x + dx, y + dy);
}
else {
	draw_self();
}

shader_reset();