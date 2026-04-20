if (current_state == QARSTATE.STILL and !dead) {
	var x_dia = x_rad * 2;
	var x_min = x_center - x_rad;
	
	for (var i = 0; i <= idle_resolution; i++) {
		var draw_x = x_min + x_dia * (i / idle_resolution);
		var draw_y = y_center;
	
		draw_sprite_ext(QarIdle, anim_frame, draw_x, draw_y, -1 * jump_direction, sign(grv), 0, c_white, 0.3);
	}		
}

if (dead or current_state == QARSTATE.JUMPING) {
	draw_self();
}

if (current_state == QARSTATE.JUMPING) {
	var progress = min(1, jump_commit_t / jump_commit_t_max);
	
	for (var i = 0; i <= jump_resolution; i++) {
		var theta = jump_angle + (i / jump_resolution) * jump_angle_sector;
		var draw_x = x + jump_distance * progress * cos(theta) * jump_direction;
		var draw_y = y + jump_distance * progress * sin(theta) * sign(grv);
	
		draw_sprite_ext(QarFly, anim_frame, draw_x, draw_y, -1 * jump_direction, sign(grv), 0, c_white, 0.3);
	}	
}

anim_frame += 1;
anim_frame %= 2;