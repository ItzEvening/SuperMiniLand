

function StageToString(_room){
	var _room_name = room_get_name(_room);
	var _output = "";
	var _length = string_length(_room_name);
	
	for (i = 1; i <= _length; i++) {
		var _char = string_char_at(_room_name, i);
		
		if(_char == "_") {
			break;
		}
		
		if (string_upper(_char) == _char and i != 1) {
			_output += "\n";
		}
		
		_output += string_upper(_char);
	}
	
	return _output;
}

function StageToNum(_room){
	var _room_name = room_get_name(_room);
	var _length = string_length(_room_name);
	var _char = string_char_at(_room_name, _length);
	
	return string_digits(_char);
}

Stage = StageToString(global.level);
Stage_Num= StageToNum(global.level);
text_to_draw=Stage;

