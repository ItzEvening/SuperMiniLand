if (control and global.savedata[?"boss unlocked"]) {
	SlideTransition(TRANS_MODE.LEVEL, Level_Card);
	global.level = BossAttack;
}