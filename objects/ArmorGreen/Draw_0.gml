var x_alpha = 1;
var y_alpha = 1;
var dx = 0;
var dy = 0;

if (!detonating) {
	var dist_from_x = abs(x - midpoint);
	dist_from_x = max(0, dist_from_x - radius * fade);

	x_alpha = 1 - (dist_from_x / segment);
	x_alpha = clamp(x_alpha, 0.3, 1);		
	
	var dist_from_y = abs(y - Player.y);
	dist_from_y = max(0, dist_from_y - 64);
	y_alpha = 1 - min(1, dist_from_y / 64);
}
else {
	dx = random_range(-1 * shake, shake);
	dy = random_range(-1 * shake, shake);
}

shader_set(LightMultiply);
shader_set_uniform_f(AmbientLight.u_color, AmbientLight.r, AmbientLight.g, AmbientLight.b, 1);

draw_sprite_ext(sprite_index, image_index, x + dx, y + dy, 2, 2, 0, c_white, x_alpha * y_alpha * spawn_alpha);

shader_reset();