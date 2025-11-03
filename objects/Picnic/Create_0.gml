hp = 4;

eat = function(_delta) {
	if (_delta > hp) {
		Evie.game_over();
		return;
	}
	
	hp -= _delta;
	audio_play_sound(EnemyDefeat, 10, 0);
}