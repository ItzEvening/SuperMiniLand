event_inherited();

trigger_key = ord("Q");
character = Evie;
bear = Arcturus;

check_boss_unlocked = function() {
	return GetSave(SV_BOSS_UNLOCKED);
}

check_tut_cmplt = function() {
	return GetSave(SV_TUTORIAL);
}

check_si_cmplt = function() {
	return check_all_gems_lvl(SV_GEM_SPRING);
}

check_mf_cmplt = function() {
	return check_all_gems_lvl(SV_GEM_MARBLE);
}

check_boss_cmplt = function() {
	return GetSave(SV_BOSS_BEATEN);
}

check_ss_cmplt = function() {
	return GetSave(SV_STARLIGHT_BEAT);
}

// overwriting parent function
generate_metadatas = function() {
	
	var _tut_spr = card_tutorial;
	if (global.music == 2) {
		_tut_spr = card_tutorialE;
	}
	
	tutM = new LevelCardData(Tutorial_M, check, check_tut_cmplt, _tut_spr, false);
	si = new LevelCardData(SpringIsland_1, check, check_si_cmplt, card_spring, true);
	mf = new LevelCardData(MarbleFortress_1, check_marble_midnight, check_mf_cmplt, card_marble, true);
	ba = new LevelCardData(BossAttack, check_boss_unlocked, check_boss_cmplt, card_boss, false);
	strsta = new LevelCardData(StarlightStation, check_all_gems, check_ss_cmplt, card_starlight, false);

	metas = [tutM, si, mf, ba, strsta]
}

global.lo.add(self, MUSIC_CHANGE, update);

update();