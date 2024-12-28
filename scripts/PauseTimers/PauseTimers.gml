// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PauseTimers(_time_source){
	var _children = time_source_get_children(_time_source);
	
	for (var i = 0; i < array_length(_children); i++) {
		PauseTimers(_children[i]);
	}
	
	if (_time_source != time_source_global and _time_source != time_source_game) {
		time_source_pause(_time_source);
	}
}