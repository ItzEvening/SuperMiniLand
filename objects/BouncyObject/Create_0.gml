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

// determine coordinates for path markers
draw_path_markers = false;
if (chosen_path == undefined or chosen_path == path_CC4_s3) {
	exit;
}

draw_path_markers = true;
var path_len = path_get_length(chosen_path);
var marker_count = round(path_len / 16);

marker_x = [];
marker_y = [];

var path_origin_x = path_get_x(chosen_path, 0);
var path_origin_y = path_get_y(chosen_path, 0);

for (var i = 0; i <= marker_count; i++) {
	var t = i / marker_count;
	
	var _x = path_get_x(chosen_path, t) - path_origin_x;
	_x += x + 32;
	
	var _y = path_get_y(chosen_path, t) - path_origin_y;
	_y += y + 16;
	
	array_push(marker_x, _x);
	array_push(marker_y, _y);
}