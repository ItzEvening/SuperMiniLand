x += cos(trajectory_direction) * trajectory_speed;
y += sin(trajectory_direction) * trajectory_speed;

var _in_room_x = (x > -32) and (x < room_width + 32);
var _in_room_y = (y > -32) and (y < room_height + 32);
var _in_room = _in_room_x and _in_room_y;

if (!_in_room) {
	instance_destroy();
}

frame++;
if (frame >= frame_max) {
	frame = 0;
	
	var new_direction = arctan2(Player.y - y, Player.x - x);
	var delta_theta = angle_difference(trajectory_direction, trajectory_direction)
	
	if (abs(delta_theta) > max_angle_delta and sign(delta_theta) == 1) {
		trajectory_direction += max_angle_delta;
	}
	else if (abs(delta_theta) > max_angle_delta and sign(delta_theta) == -1) {
		trajectory_direction -= max_angle_delta;
	}
	else {
		trajectory_direction = new_direction;
	}
	
	image_xscale = 1;
	image_angle = radtodeg(-1 * (trajectory_direction + pi));
}