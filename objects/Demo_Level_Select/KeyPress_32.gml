if (control and GetSave(SV_BOSS_UNLOCKED)) {
	SlideTransition(TRANS_MODE.LEVEL, Level_Card);
	global.level = BossAttack;
}