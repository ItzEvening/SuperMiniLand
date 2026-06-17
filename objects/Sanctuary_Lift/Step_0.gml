event_inherited();

// check if too slow
if (Player.y > max_acceptable_y and !CC6_Game.restarting) {
	CC6_Game.too_slow();
}