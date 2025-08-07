update = function() {
	if (global.bear) {
		if (GetSave(SV_BOSS_UNLOCKED)) {
			sprite_index = Demo_Level_6;
		}
		else {
			sprite_index = Demo_Level_5;
		}
	}
	else {
		if (GetSave(SV_BOSS_UNLOCKED)) {
			sprite_index = Demo_Level_4;
		}
		else {
			sprite_index = Demo_Level_3;
		}
	}
}

control = true;