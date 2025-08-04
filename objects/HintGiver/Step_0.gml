event_inherited();

var _player = instance_place(x, y, Player);

if (_player != noone and _player.y < bbox_top and _player.vsp > -3) {
	audio_play_sound(Discovery, 10, 0);
	_player.livesText = "follow the light";
	instance_destroy();
}