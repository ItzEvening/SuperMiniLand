event_inherited();

dead = false;
hp = 6;
invincible = false;
phase = 0;
frame = BOSS_IDLE;

recover = function() {
	invincible = false;
	frame = BOSS_IDLE;
	hurt = false;
}

end_fight = function() {
	with (Player)
	{
		if (hascontrol)
		{
			hascontrol = false;
			global.savedata[? "boss beaten"] = true;
			
			if (!global.savedata[? "sanctuary accessed"]) {
				room_goto(HintLevel);
			}
			else {
				SlideTransition(TRANS_MODE.GOTO, Demo_End);
			}
		}
	}
}

get_frame_index = function(_status) {
	// This should do not do anything since this is an abstract superobject
}

function inv_callback(_boss) {
	with (_boss) {
		recover();
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

invincible_timer = time_source_create(time_source_global, 1.5, time_source_units_seconds, inv_callback, [self]);
end_timer = time_source_create(time_source_global, 2.5, time_source_units_seconds, end_fight);