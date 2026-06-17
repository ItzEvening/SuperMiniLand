if (enabled and !CC6_Game.restarting) {
	show_debug_message("triggered restart");
	enabled = false;
	Sanctuary_Lift.max_acceptable_y = max_acceptable_y;
}