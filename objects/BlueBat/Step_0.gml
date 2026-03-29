event_inherited();

if (!dead) {
	hsp = xspeed;
	y = yoriginal + amp * sin(t * (2 * pi / 2));
}

t += delta_time / 1000000;
t = t % 2;

var _in_room_x = (x > -32) and (x < room_width + 32);
var _in_room_y = (y > -32) and (y < room_height + 32);
var _in_room = _in_room_x and _in_room_y;

if (!_in_room) {
	instance_destroy();
}