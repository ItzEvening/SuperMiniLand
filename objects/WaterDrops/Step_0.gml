event_inherited();

if (y > room_height + 32 || abs(original_y - y) > max_height) {
	instance_destroy();
}
else {
	vsp = 9 * sign(grv);
}