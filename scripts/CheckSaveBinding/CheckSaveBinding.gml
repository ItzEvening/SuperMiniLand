// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckSaveBinding(_key, _value){
	if (!ds_map_exists(global.savedata, _key)) {
		global.savedata[? _key] = _value;
	}
}