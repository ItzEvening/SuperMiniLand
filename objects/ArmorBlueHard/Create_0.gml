event_inherited();

idle_sprite = ArmorSalmonBlueIdle;
attack_sprite = ArmorSalmonBlueAttack;
projectile = Projectile_Arrow_Blue;
proj_dy = 16;

max_dx = 4;

if (global.difficulty > 1) {
	projectile = Projectile_Arrow_Blue_Hard;
	arrow_speed = 1;
	attack_period = 15;
	
	time_source_reconfigure(attack_timer, attack_period, time_source_units_seconds, decide_attack);
}