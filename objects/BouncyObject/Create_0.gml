calculate_bounce_strength = function() {
	var _vsp = y - yprevious;
	var _str = 6.5;
	
	if (_vsp > 1.2) {
		
		_str -= 5 * (min(3, _vsp) / 3);
	}
	
	
	return _str;
}

if (chosen_path != undefined) {
	
	if (sync) {
		path_sp = (path_get_length(chosen_path) / sync_len) * sync_time;
	}
	path_start(chosen_path, path_sp, path_action_reverse, false);
}