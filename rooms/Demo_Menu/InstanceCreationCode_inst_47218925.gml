levels = [Tutorial_M, SpringIsland_1, MarbleFortress, BossAttack];
access = [true, true, global.savedata[? "boss beaten"], global.savedata[? "boss unlocked"]];
sprites = [card_tutorial, card_spring, card_marble, card_boss];
trigger_key = ord("Q");
character = Evie;
bear = Arcturus;

update = function() {
	access = [true, true, global.savedata[? "boss beaten"], global.savedata[? "boss unlocked"]];

	if (access[index]) {
		sprite_index = sprites[index];
	}
	else {
		sprite_index =  card_lockedQ;
	}
}

update();