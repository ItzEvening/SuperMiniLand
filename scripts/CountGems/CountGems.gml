// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CountGems(_advanced){
	var _arr = ["spring", "salmon"];
	var _return = 0;
	
	if (_advanced) {
		_arr = ["spring", "salmon", "secret"];
	}
	
	for (var i = 0; i < array_length(_arr); i++) {
		var _collected = global.savedata[? _arr[i]];
		
		for (var j = 0; j < ds_list_size(_collected); j++) {
			if (_collected[| j]) {
				_return++;
			}
		}
	}
	
	return _return;
}