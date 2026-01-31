if (place_meeting(x, y, Allie)) {
	if (enabled) {
		displaying = true;
		Allie.hascontrol = false;
		global.lo.send(TOGGLE_GUI, false);
	}
	
	enabled = false;
} else {
	enabled = true;
}