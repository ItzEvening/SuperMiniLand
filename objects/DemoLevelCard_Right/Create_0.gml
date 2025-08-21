event_inherited();

trigger_key = ord("E");
lock_sprite = card_lockedE;

bool_callback_bears = function() {
	return GetSave(SV_BEARS_UNLOCKED);
}

bool_callback_sanctuary = function() {
	return GetSave(SV_SANCT_FOUND);
}

// overwriting parent function
generate_metadatas = function() {
	tutA = new LevelCardData(Tutorial_AL, bool_callback_bears, card_2torial, false);
	sp = new LevelCardData(SalmonPalace_1, bool_callback, card_salmon, true);
	mr = new LevelCardData(MidnightRush_1, bool_callback_marble_midnight, card_midnight, true);
	secsan = new LevelCardData(SecretSanctuary, bool_callback_sanctuary, card_secret, false);
	bc = new LevelCardData(Blank_Canvas, bool_callback_all_gems, card_blank, false);

	metas = [tutA, sp, mr, secsan, bc];
}

update();