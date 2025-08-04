/// @func CheckSaveBinding()
/// @desc Initializes default save binding when non-existent, otherwise does nothing
/// @param {String} _key Binding key
/// @param {Any} _value Binding value

function CheckSaveBinding(_key, _value){
	if (!ds_map_exists(global.savedata, _key)) {
		global.savedata[? _key] = _value;
	}
}