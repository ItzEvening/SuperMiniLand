/// @func SetSave(_key, _val)
/// @desc Writes a save binding to memory. Note that this does not write to save file.
/// @param {String} _key The key of the save binding
/// @param {Any} _val The value of the save binding
function SetSave(_key, _val){
	global.savedata[? _key] = _val;
}