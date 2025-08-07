/// @func GetSave(_key)
/// @desc Get a saved value
/// @param {String} _key The key of the save binding
/// @return The saved value
function GetSave(_key){
	return global.savedata[? _key];
}