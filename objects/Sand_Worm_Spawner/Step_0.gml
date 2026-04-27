if (!hasworm and !ready) {
	t += delta_time / 1000000;
}

if (t > t_max) {
	t = 0;
	ready = true;
}

if (ready and abs(Player.x - next_x) <= detect_distance) {
	spawn_worm();
}