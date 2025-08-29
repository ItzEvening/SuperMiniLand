spr_default = SignYes;
spr_switch = SignYesSwitch;

switch_sign = function(_id) {
	if (signal_id == _id) {
		sprite_index = spr_switch;
		time_source_start(revert_timer);
	}
}

revert = function() {
	image_index = 0;
	sprite_index = spr_default;
	image_speed = 1;
}

revert_timer = time_source_create(time_source_global, 10, time_source_units_seconds, revert);

global.lo.add(self, SWITCH_SIGNS, switch_sign);