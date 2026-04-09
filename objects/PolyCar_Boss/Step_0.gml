event_inherited();

if (x < thresh_x) {
	if (trigger_fly_end) {
		SpringIslandBoss.end_fly = true;
	}
	
	instance_destroy();
	
}