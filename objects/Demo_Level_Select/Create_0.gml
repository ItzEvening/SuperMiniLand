update = function() {
	if (global.bear) {
		if (global.savedata[? "boss unlocked"]) {
			sprite_index = Demo_Level_6;
		}
		else {
			sprite_index = Demo_Level_5;
		}
	}
	else {
		if (global.savedata[? "boss unlocked"]) {
			sprite_index = Demo_Level_4;
		}
		else {
			sprite_index = Demo_Level_3;
		}
	}
}

control = true;