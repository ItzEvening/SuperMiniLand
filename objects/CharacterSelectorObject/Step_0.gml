if (selected) {
	t += delta_time / 1000000;
}

if (t > t_max) {
	controllable = false;
	SlideTransition(TRANS_MODE.LEVEL, Level_Card);
}