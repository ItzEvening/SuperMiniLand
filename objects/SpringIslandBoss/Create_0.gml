event_inherited();

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
			
			randomize();
			var _random = random(2);
			
			if (_random < 1) {
				
				audio_stop_all();
				room_goto(Test);
				
			}
			else {
				SlideTransition(TRANS_MODE.GOTO, Demo_End);

			}
			

		}
	}
}

state = 0;
hp = 6;
invincible = false;
invincible_timer = time_source_create(time_source_global, 1.5, time_source_units_seconds, recover);
end_timer = time_source_create(time_source_global, 2.5, time_source_units_seconds, end_fight);