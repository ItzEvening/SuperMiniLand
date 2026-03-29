if (t > timetobat) {
	var sgn = 1 - (irandom(1) * 2);
	var batxspeed = 4;
	var spawnx = Player.x - 400;
	var dy = random_range(-96, 96);
	
	batxspeed *= sgn;
	
	if (sgn == -1) {
		spawnx = Player.x + 400;
	}
	
	var bat = instance_create_layer(spawnx, Player.y + dy, enemy_layer, BlueBat);
	bat.image_xscale *= -1 * sgn;
	bat.xspeed = batxspeed;
	
	timetobat = random_range(3, 6);
	t = 0;
}


else {
	t += delta_time / 1000000;
}