var _count = 0;
var _advanced = global.savedata[? "boss beaten"];

_count = CountGems(_advanced);

if (_advanced) {
	sprite_index = GemProgressAdvanced;
	image_index = _count - 10;
}
else {
	image_index = _count;
}


if (_count == 10) {
	if (!global.savedata[? "boss unlocked"]) {
		
		PopupManager.notify(PolyAlert, "boss unlocked");
		
	}
	Demo_Level_Select.update();
}