event_inherited();

if (!triggered and distance_to_object(Player) < 225) {
	sprite_index = BatFly;
	
	
	delta_x = Player.x - x;
	delta_y = Player.y - y;
	
	var _hypotenuse = sqrt(delta_x * delta_x + delta_y * delta_y);
	
	delta_x *= fly_speed / _hypotenuse;
	delta_y *= fly_speed / _hypotenuse;
	
	if (delta_x > 0) {
		image_xscale = -1;
	}
	
	triggered = true;
}

var _in_room_x = (x > -32) and (x < room_width + 32);
var _in_room_y = (y > -32) and (y < room_height + 32);
var _in_room = _in_room_x and _in_room_y;

if (triggered and _in_room and !dead) {
	x += delta_x;
	y += delta_y;
}
else if (!_in_room) {
	instance_destroy();
}