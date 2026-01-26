update_sprite = function() {
	if (global.music.current == 2) {
		sprite_index = Menu_BG_E;
	}
	else {
		sprite_index = Menu_BG;
	}
}

global.lo.add(self, MUSIC_CHANGE, update_sprite);

update_sprite();