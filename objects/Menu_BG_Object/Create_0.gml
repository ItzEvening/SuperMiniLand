update_sprite = function() {
	if (global.music == 0) {
		sprite_index = Menu_BG;
	}
	else {
		sprite_index = Menu_BG_E;
	}
}

global.lo.add(self, MUSIC_CHANGE, update_sprite);

update_sprite();