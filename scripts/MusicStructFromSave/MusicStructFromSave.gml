// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MusicStructFromSave(){
	var _music = new MusicStruct();
	
	if (GetSave(SV_MUS_CONFIG) == 3) {
		_music.custom = true;
	}
	
	_music.weightM = GetSave(SV_MUS_MINI);
	_music.weight8 = GetSave(SV_MUS_8BIT);
	_music.weightE = GetSave(SV_MUS_EVIE);
	
	if (GetSave(SV_MUS_CONFIG) < 3) {
		_music.current = GetSave(SV_MUS_CONFIG);
	}
	
	return _music;
}