custom_path = path_duplicate(path);

var _p = 0;

while (_p < p_index) {
	var _p_x = path_get_point_x(custom_path, 0);
	var _p_y = path_get_point_y(custom_path, 0);
	path_delete_point(custom_path, 0);
	path_add_point(custom_path, _p_x, _p_y, 100);
	_p++;
}

path_start(custom_path, p_speed, path_action_continue, true);