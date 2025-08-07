var _count = 0;
var _advanced = GetSave(SV_BOSS_BEATEN);

_count = CountGems(_advanced);

if (_advanced) {
	sprite_index = GemProgressAdvanced;
	image_index = _count - 10;
}
else {
	image_index = _count;
}


if (_count == 10) {
	if (!GetSave(SV_BOSS_UNLOCKED)) {
		
		PopupManager.notify(PolyAlert, SV_BOSS_UNLOCKED);
		
	}
}
else if (_count == 30) {
	if (!GetSave(SV_ALL_GEMS)) {
		
		PopupManager.notify(GemAlert, SV_ALL_GEMS);
		
	}
}

if (GetSave(SV_BOSS_BEATEN) and !GetSave(SV_MAR_MID_UNLOCKED)) {
	PopupManager.notify(VictoryAlert, SV_MAR_MID_UNLOCKED);
}
