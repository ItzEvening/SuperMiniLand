trigger_key = ord("E");
lock_sprite = card_lockedE;

bool_callback_bears = function() {
	return global.savedata[? "bears unlocked"];
}

bool_callback_sanctuary = function() {
	return global.savedata[? "sanctuary accessed"];
}

tutA = new LevelCardData(Tutorial_AL, bool_callback_bears, card_2torial, false);
sp = new LevelCardData(SalmonPalace_1, bool_callback, card_salmon, true);
mr = new LevelCardData(MidnightRush_1, bool_callback_boss_beaten, card_midnight, true);
secsan = new LevelCardData(SecretSanctuary, bool_callback_sanctuary, card_secret, false);
bc = new LevelCardData(Blank_Canvas, bool_callback_all_gems, card_blank, false);

metas = [tutA, sp, mr, secsan, bc]

update();