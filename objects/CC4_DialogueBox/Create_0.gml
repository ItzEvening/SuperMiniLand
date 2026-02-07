display = false;
delay = 3;
text = "";
index = 0;
text_progress = 0;
target_progress = 0;
json = undefined;
color = make_color_rgb(203, 88, 255);

pizzas_requested = 0;
pizzas_ordered = 0;

progressable = false;
sound = sfx_CC4_d_Default;
spr = spr_CC4_d_Phone;

prank = false;
emergency = false;

order_pizza = function(_amt) {
	
	// ran out
	if (pizzas_ordered > 4) {
		if (Allie.raging) {
			load(31);
		} else {
			load(21);
		}
	} 
	
	// has supply
	else {
		pizzas_requested = _amt;
		pizzas_ordered += _amt;
		
		if (Allie.raging) {
			load(11);
		} else {
			load(1);
		}
	}
}

current_dialogue = function() {
	return json.dialogue[index];
}

end_dialogue = function() {
	display = false;
	json = undefined;
	index = 0;
	Allie.patient = false;
	global.lo.send(TOGGLE_GUI, true);
	audio_play_sound(sfx_CC4_hangup, 10, false);
	CC4_CallConsole.sprite_index = spr_CC4_console;
	show_debug_message("Ending dialogue");
	
	PerpendicularPizza.queue = pizzas_requested;
	pizzas_requested = 0;
	
	if (prank) {
		MusicPlayer.play_music();
		Allie.angry();
	}
	prank = false;
	
	if (emergency) {
		instance_create_layer(17760, 17696, layer, PolyCop_CC4);
	} else {
		Allie.hascontrol = true;
	}
	emergency = false;
}

load = function(_num) {
	var _filename = "cc4/cc4_dialogue_" + string(_num) + ".json";
	json = JSONHelper(_filename);
	display = true;
	Allie.patient = true;
	
	update();
}

update = function() {
	target_progress = string_length(current_dialogue().text);	
	
	// define progressable
	if (current_dialogue().delay > 0) {
		progressable = false;
	} else {
		progressable = true;
	}
		
	// define sound
	sound = asset_get_index("sfx_CC4_d_" + current_dialogue().sound);
	
	// define sprite
	spr = asset_get_index("spr_CC4_d_" + current_dialogue().sprite);
}

next = function() {
	show_debug_message("Next dialogue");
	text = "";
	text_progress = 0;
	
	if (index + 1 == array_length(json.dialogue)) {
		end_dialogue();
	}
	
	else {
		index++;
		update();
		
		if (current_dialogue().shake) {
			global.lo.send(TOGGLE_SHAKE, true);
			time_source_start(shake_timer);
		}
	}
}

timer = time_source_create(time_source_global, 1, time_source_units_seconds, next);

update_text = function() {
	text_progress++;
	text += string_char_at(current_dialogue().text, text_progress);
	audio_play_sound(sound, 10, false);
	
	if (text_progress == target_progress and !progressable) {
		time_source_reconfigure(timer, current_dialogue().delay, time_source_units_seconds, next);
		time_source_start(timer);
	}
}

expire_shake = function() {
	global.lo.send(TOGGLE_SHAKE, false);
}

shake_timer = time_source_create(time_source_global, 1, time_source_units_seconds, expire_shake);