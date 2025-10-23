max_index = 4;
index = 0;
metas = [];
trigger_key = vk_enter;
character = Mini;
bear = Allie;
lock_sprite = card_lockedQ;
completed = false;

LevelCardData = function(_level, _requirement, _complete_requirement, _sprite, _chr_bound) constructor {
	lvl = _level;
	requirement = _requirement;
	complete_requirement = _complete_requirement
	sprite = _sprite;
	chr_bound = _chr_bound;
}

check = function() {
	return true;
}

creepy = function() {
	return false;
}

check_marble_midnight = function() {
	return GetSave(SV_MAR_MID_UNLOCKED);
}

check_all_gems = function() {
	return CountGems(true) == 30;
}

check_all_gems_lvl = function(_lvl_macro) {
	var _gems = GetSave(_lvl_macro);
	
	for (var i = 0; i < ds_list_size(_gems); i++) {
		if (!_gems[| i]) {
			return false;
		}
	}
	
	return true;
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
	
	completed = script_execute(_card_data.complete_requirement);
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