event_inherited();

trigger_key = ord("Q");
character = Evie;
bear = Arcturus;
tut_spr = card_tutorial;

bool_callback_boss_unlocked = function() {
	return GetSave(SV_BOSS_UNLOCKED);
}

// overwriting parent function
generate_metadatas = function() {
	
	tutM = new LevelCardData(Tutorial_M, bool_callback, tut_spr, false);
	si = new LevelCardData(SpringIsland_1, bool_callback, card_spring, true);
	mf = new LevelCardData(MarbleFortress_1, bool_callback_marble_midnight, card_marble, true);
	ba = new LevelCardData(BossAttack, bool_callback_boss_unlocked, card_boss, false);
	strsta = new LevelCardData(StarlightStation, bool_callback_all_gems, card_starlight, false);

	metas = [tutM, si, mf, ba, strsta]
}

update();