max_index = 4;
index = 0;
metas = [];
trigger_key = vk_enter;
character = Mini;
bear = Allie;
lock_sprite = card_lockedQ;

LevelCardData = function(_level, _requirement, _sprite, _chr_bound) constructor {
	lvl = _level;
	requirement = _requirement;
	sprite = _sprite;
	chr_bound = _chr_bound;
}

bool_callback = function() {
	return true;
}

bool_callback_marble_midnight = function() {
	return GetSave(SV_MAR_MID_UNLOCKED);
}

bool_callback_all_gems = function() {
	return CountGems(true) == 30;
}

// to be overwritten by child objects
generate_metadatas = function() {
	metas = [];
}

update = function() {
	generate_metadatas();
	var _card_data = metas[index];
	
	if (script_execute(_card_data.requirement)) {
		sprite_index = _card_data.sprite;
	}
	else {
		sprite_index = lock_sprite;
	}
	
	if (!_card_data.chr_bound) {
		Challenge.visible = false;
	}
	else {
		Challenge.visible = true;
	}
}

increment = function(_i) {
	
	if (index == max_index and _i > 0) {
		index = 0;
	}
	else if (index == 0 and _i < 0) {
		index = max_index;
	}
	else {
		index += sign(_i);
	}
	
	o_MenuDots.image_index = index;
	update();
}

determine_character = function() {
	var _card_data = metas[index];
	
	var _tutorial = (_card_data.lvl == Tutorial_M);
	var _2torial = (_card_data.lvl == Tutorial_AL);

	//if tutorial mini
	if (_tutorial) {
		global.character = Mini;
	}
	// if tutorial bear
	else if (_2torial) {
		global.character = Allie;
	}
	else if (_card_data.chr_bound) {
		global.character = character;
		
		if (global.bear) {
			global.character = bear;
		}
	}
}