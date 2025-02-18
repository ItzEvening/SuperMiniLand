music = undefined;

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

var _song = asset_get_index(_track_name);

// E-sides
var _track_name_e = _track_name + "E";
var _song_e = asset_get_index(_track_name_e);

if (_song_e != -1 and variable_global_exists("music") and global.music == 1) {
	_song = _song_e;
}

if (_song != -1)
{
	music = audio_play_sound(_song, 10, true);
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
	// show_debug_message("bad girl");
	if (!is_undefined(music))
	{
		audio_stop_sound(music);
	}
}

function play_music(_sound)
{
	music = audio_play_sound(_sound, 10, true);
}