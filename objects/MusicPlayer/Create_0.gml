music = undefined;
song = undefined;

decide_music = function() {
	
	var _sum = global.music.weight8 + global.music.weightM + global.music.weightE;

	if (_sum == 0) {
		global.music.current = -1;
		return;
	}

	var _r = 1 + irandom(_sum - 1);
	
	_r -= global.music.weightM;
	if (_r <= 0) {
		global.music.current = 0;
		return;
	}
	
	_r -= global.music.weight8;
	if (_r <= 0) {
		global.music.current = 1;
		return;
	}
	
	global.music.current = 2;
	return;
}

if (global.music.custom) {
	decide_music();
}

#region Get Stage Music
var _music_json = JSONHelper("stage_themes.json");
var _music_list = _music_json.Stage_themes;
var _track_name = "";

for (var i = 0; i < array_length(_music_list); i++)
{
	var _stage_track = _music_list[i];
	var room_name = room_get_name(room);
	
	if (string_starts_with(room_name, _stage_track.Stage))
	{
		_track_name = _stage_track.Song;
		break;
	}
}

song = asset_get_index(_track_name);

// M-mix
var _track_name_m = _track_name + "M";
var _song_m = asset_get_index(_track_name_m);

if (_song_m != -1 and variable_global_exists("music") and global.music.current == 0) {
	song = _song_m;
}

// V-mix
var _track_name_e = _track_name + "E";
var _song_e = asset_get_index(_track_name_e);

if (_song_e != -1 and variable_global_exists("music") and global.music.current == 2) {
	song = _song_e;
}

if (song != -1 and global.music.current >= 0)
{
	music = audio_play_sound(song, 10, true);
}
#endregion

function underwater_effect(_was_underwater)
{
	if (!is_undefined(music))
	{
		if (_was_underwater)
		{
			audio_bus_main.effects[0] = undefined;
		}
		else
		{
			var _effect = audio_effect_create(AudioEffectType.LPF2);
			_effect.cutoff = 600;
			audio_bus_main.effects[0] = _effect;
		}
	}
}

function stop_music()
{
	if (!is_undefined(music))
	{
		audio_stop_sound(music);
	}
}

function play_music(_sound = -1, _offset = 0)
{
	if (_sound == -1) {
		_sound = song;
	}
	
	if (global.music.current >= 0) {
		music = audio_play_sound(_sound, 10, true, 1, _offset);
	}
}

function get_track_position() {
	if (music != undefined) {
		return audio_sound_get_track_position(music);
	}
	
	return 0;
}