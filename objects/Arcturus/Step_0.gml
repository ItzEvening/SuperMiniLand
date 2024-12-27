event_inherited();

var _gimmick = keyboard_check(vk_space) or keyboard_check(ord("W"));

if (_gimmick and vsp > 2) {
	vsp = 2;
}