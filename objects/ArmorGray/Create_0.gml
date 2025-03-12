event_inherited();

killable = false;
obey_gravity = false;
go_attack = true;
attacking = false;
attack_length = 7/15;

decide_attack = function() {
	go_attack = true;
}

attack_timer = time_source_create(time_source_global, 2, time_source_units_seconds, decide_attack);

expire_attack = function() {
	go_attack = false;
	attacking = false;
	time_source_start(attack_timer);
}

expire_timer = time_source_create(time_source_global, attack_length, time_source_units_seconds, expire_attack)