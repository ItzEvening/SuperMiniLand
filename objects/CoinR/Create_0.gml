collected = false;

collect = function() {
	collected = true;
	visible = false;
	audio_play_sound(CoinGotR, 10, 0);
}