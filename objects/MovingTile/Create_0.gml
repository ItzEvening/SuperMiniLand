guide = instance_create_layer(x, y, layer, MovingPlatformGuide, {
	path_to_follow: path_to_follow,
	path_sp: path_sp
});

find_speed = function(_axis) {
	
	if (_axis == "x") {
		return dx;
	}
	
	return dy;
}

dx = 0;
dy = 0;