levels = [Tutorial_AL, SalmonPalace_1, MidnightRush_1, SecretSanctuary];
access = [global.savedata[? "bears unlocked"], true, global.savedata[? "boss beaten"], global.savedata[? "sanctuary accessed"]];
sprites = [card_2torial, card_salmon, card_midnight, card_secret];
trigger_key = ord("E");

update = function() {
	access = [global.savedata[? "bears unlocked"], true, global.savedata[? "boss beaten"], global.savedata[? "sanctuary accessed"]];
	if (access[index]) {
		sprite_index = sprites[index];
	}
	else {
		sprite_index =  card_lockedE;
	}
	
	if (levels[index] == Tutorial_AL or levels[index] == SecretSanctuary) {
		Challenge.visible = false;
	}
	else {
		Challenge.visible = true;
	}
}

update();