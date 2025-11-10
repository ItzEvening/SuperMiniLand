/// @func CheckSaveBinding()
/// @desc Initializes default save binding when non-existent, otherwise does nothing
/// @param {String} _key Binding key
/// @param {Any} _value Binding value

function CheckSaveBinding(_key, _value){
	// if binding is nonexistent
	if (!ds_map_exists(global.savedata, _key)) {
		SetSave(_key, _value);
	}
	
	// if binding value is of different types
	//if (typeof(global.savedata[? _key]) != typeof(_value)) {
	//	SetSave(_key, _value);
	//}
	
	// if binding values (array) are of different length
}