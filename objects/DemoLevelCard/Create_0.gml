max_index = 3;
index = 0;
levels = [];
access = [];
sprites = [];
trigger_key = vk_enter;
character = Mini;
bear = Allie;

update = function() {
	access = [];
	sprite_index = sprites[index];
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
	var _level = levels[index];
	
	var _tutorial = (levels[index] == Tutorial_M);
	var _2torial = (levels[index] == Tutorial_AL);
	var _boss = (levels[index] == BossAttack);
	var _secret = (levels[index] == SecretSanctuary);

	//if tutorial mini
	if (_tutorial) {
		global.character = Mini;
	}
	// if tutorial bear
	else if (_2torial) {
		global.character = Allie;
	}
	// not boss or secret sanctuary
	else if (!_boss and !_secret) {
		global.character = character;
		
		if (global.bear) {
			global.character = bear;
		}
	}
}