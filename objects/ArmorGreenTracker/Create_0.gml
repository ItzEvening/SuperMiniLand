t = 0;
t_max = random_range(1, 5);

reset = function() {
	t = 0;
	t_max = random_range(1, 5);
}

check_explode = function() {
	var dt = delta_time / 1000000;
	
	if (t + dt >= t_max) {
		reset();
		return true;
	}
	
	t += dt;
	return false;
}