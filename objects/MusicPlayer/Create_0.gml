music = undefined;

if (room == Camera_Test_2)
{
	music = audio_play_sound(SalmonPalace, 10, 1);
}

//underwater_effect = function(_was_underwater)
function underwater_effect(_was_underwater)
{
	if (!is_undefined(music))
	{
		var _track_position = audio_sound_get_track_position(music);
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

if (room == Water_Test3)
{
	music = audio_play_sound(Cave, 10, 1);
}

function underwater_effect(_was_underwater)
{
	if (!is_undefined(music))
	{
		var _track_position = audio_sound_get_track_position(music);
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