if (current_state == QARSTATE.STILL and !dead) {
	var xsc = 2 * x_rad / 32;
	draw_sprite_ext(QarCloud, 0, x_center, y, xsc, 1, 0, c_white, 0.7);
}

draw_self();

if (current_state == QARSTATE.JUMPING) {
	
	for (var i = 0; i <= jump_resolution; i++) {
		var theta = jump_angle + (i / jump_resolution) * jump_angle_sector;
		var draw_x = x + jump_distance * cos(theta) * jump_direction;
		var draw_y = y + jump_distance * sin(theta) * sign(grv);
	
		draw_sprite_ext(QarFly, anim_frame, draw_x, draw_y, -1 * jump_direction, 1, 0, c_white, 0.3);
	}	
}

anim_frame += 1;
anim_frame %= 2;