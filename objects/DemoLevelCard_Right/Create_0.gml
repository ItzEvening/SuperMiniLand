event_inherited();

trigger_key = ord("E");
lock_sprite = card_lockedE;

check_bears = function() {
	return GetSave(SV_BEARS_UNLOCKED);
}

check_sanctuary = function() {
	return GetSave(SV_SANCT_FOUND);
}

check_tut_cmplt = function() {
	return GetSave(SV_TUTORIAL_2);
}

check_sp_cmplt = function() {
	return check_all_gems_lvl(SV_GEM_SALMON);
}

check_mr_cmplt = function() {
	return check_all_gems_lvl(SV_GEM_MIDNIGHT);
}

check_ss_cmplt = function() {
	return check_all_gems_lvl(SV_GEM_SECRET);
}

check_cc_cmplt = function() {
	return check_all_gems_lvl(SV_CANVAS_CHALLENGE) && GetSave(SV_SPRING_HARD_BEAT) && GetSave(SV_SALMON_HARD_BEAT);
}

// overwriting parent function
generate_metadatas = function() {
	tutA = new LevelCardData(Tutorial_AL, check_bears, check_tut_cmplt, card_2torial, false);
	sp = new LevelCardData(SalmonPalace_1, check, check_sp_cmplt, card_salmon, true);
	mr = new LevelCardData(MidnightRush_1, check_marble_midnight, check_mr_cmplt, card_midnight, true);
	secsan = new LevelCardData(SecretSanctuary, check_sanctuary, check_ss_cmplt, card_secret, false);
	bc = new LevelCardData(Blank_Canvas, check_all_gems, check_cc_cmplt, card_blank, false);

	metas = [tutA, sp, mr, secsan, bc];
}

update();