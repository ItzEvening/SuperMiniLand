time = duration;


enemy_layer = layer_get_id("Drills");
enemy_spawner = instance_create_layer(x - 4 * 32, y + 3 * 32, enemy_layer, PolyCar_Spawner, {
	spawn_active: false,
	die_x: 18688
});

show_debug_message(enemy_spawner);

reset = function() {
	time = duration;
	update_sprite();
	time_source_stop(tick_timer);
	enemy_spawner.spawn_active = false;
}

update_sprite = function() {
	var _sprite_name = "Number_Sign_" + string(time);
	show_debug_message(_sprite_name);
	var _spr = asset_get_index(_sprite_name);
	sprite_index = _spr;
}

tick = function() {
	time--;
	update_sprite();
	
	if (time == 0) {
		enemy_spawner.spawn_active = true;
		
		if (Allie.y < y + 32 * 4) {
			audio_play_sound(sfx_Car_Horn_3, 10, false);
		}
	}
}

tick_timer = time_source_create(time_source_global, 1, time_source_units_seconds, tick, [], duration);

trigger = function(_label) {
	if (_label == label) {
		time_source_start(tick_timer);
	}
}

global.lo.add(self, TRIGGER_CAR_TIMER, trigger);
global.lo.add(self, PLAYER_DEATH, reset);

update_sprite();