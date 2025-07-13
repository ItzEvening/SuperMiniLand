event_inherited();

dead = false;
state = 0;
hp = 6;
invincible = false;
phase = 0;

dead_state = 3;
hurt_state = 2;

recover = function() {
	invincible = false;
	state = 0;
}

end_fight = function() {
	with (Player)
	{
		if (hascontrol)
		{
			hascontrol = false;
			global.savedata[? "boss beaten"] = true;
			SlideTransition(TRANS_MODE.GOTO, Demo_End);

		}
	}
}



change_phase = function() {
	if (hp == 4) {
		phase = 1;
	}
	else if (hp == 2) {
		phase = 2;
	}
}

invincible_timer = time_source_create(time_source_global, 1.5, time_source_units_seconds, recover);
end_timer = time_source_create(time_source_global, 2.5, time_source_units_seconds, end_fight);