event_inherited();

if (!descending) {
	var _dist = abs(x - Picnic.x);

	if (_dist <= 50) {
		descending = true;
		path_end();
		vsp = 2;
	}
}