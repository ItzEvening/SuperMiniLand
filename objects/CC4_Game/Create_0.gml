colors = ["R", "G", "B", "T", "P", "W", "K"];
options = [2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5];
config = [];
levels = 11;
answers = [];
answers_c = [];

for (var i = 0; i < levels; i++) {
	
	var _conf = [];
	var _op = options[i];
	
	// generate answer
	var _answer = irandom(_op - 1);
	array_push(answers, _answer);
	
	var _colors = ["R", "G", "B", "T", "P", "W", "K"];
	
	for (var j = 0; j < _op; j++) {
		var _len = array_length(_colors) - 1;
		
		var _r = irandom(_len);
		var _c = _colors[_r];
		
		array_delete(_colors, _r, 1);
		
		array_push(_conf, _c);
	}
	
	array_push(answers_c, _conf[_answer]);
	
	array_push(config, _conf);
}