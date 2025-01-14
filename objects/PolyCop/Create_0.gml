event_inherited();

walk_direction = -1;
walksp = 7;

player_detected = false;
timer_running = false;
range = 400;

sfx_dead = sfx_Car_Horn;
spr_dead = CarCopDead;

activate_siren = function() {
	
	timer_running = false;
}

siren_timer = time_source_create(time_source_global, 2, time_source_units_seconds, activate_siren);