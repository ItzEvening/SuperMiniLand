/// @func RotatePath(_path, _n)
/// @desc Does a left rotation to a path
/// @param {Asset.GMPath} _path The amount of points to rotate a path by
/// @param {Real} _n The amount of points to rotate a path by
function RotatePath(_path, _n){
	var _p = 0;

	while (_p < _n) {
		var _p_x = path_get_point_x(_path, 0);
		var _p_y = path_get_point_y(_path, 0);
		path_delete_point(_path, 0);
		path_add_point(_path, _p_x, _p_y, 100);
		_p++;
	}
}