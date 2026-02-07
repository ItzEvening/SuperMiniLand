if (delay == 0) {
	if (queue > 0) {
		make_pizza();
		queue--;
	}
	
	delay = 6;
} else {
	delay--;
}