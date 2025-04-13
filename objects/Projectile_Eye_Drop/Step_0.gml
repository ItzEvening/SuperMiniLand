x += cos(trajectory_direction) * trajectory_speed;
y += sin(trajectory_direction) * trajectory_speed;

var _in_room_x = (x > -32) and (x < room_width + 32);
var _in_room_y = (y > -32) and (y < room_height + 32);
var _in_room = _in_room_x and _in_room_y;

if (!_in_room) {
	instance_destroy();
}