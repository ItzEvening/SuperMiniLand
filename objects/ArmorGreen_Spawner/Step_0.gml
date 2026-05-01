if (!summoned) {
	t += delta_time / 1000000;
}

if (t >= t_max) {
	spawn();
}