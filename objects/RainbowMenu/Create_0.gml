var _count = 0;

var _spring = global.savedata[? "spring"];
var _salmon = global.savedata[? "salmon"];

// count the amount of rainbow gems
for (var i = 0; i < ds_list_size(_spring); i++) {
	if (_spring[| i]) {
		_count++;
	}
}
for (var i = 0; i < ds_list_size(_salmon); i++) {
	if (_salmon[| i]) {
		_count++;
	}
}

image_index = _count;

if (_count == 10) {
	if (!global.savedata[? "boss unlocked"]) {
		
		PopupManager.notify(PolyAlert, "boss unlocked");
		
	}
	Demo_Level_Select.update();
}