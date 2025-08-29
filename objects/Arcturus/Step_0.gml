event_inherited();

var _gimmick = keyboard_check(vk_space) or keyboard_check(ord("W"));

var _norm_g = vsp > 2 and sign(grv) == 1;
var _rev_g = vsp < -2 and sign(grv) == -1;

if (_gimmick and (_norm_g or _rev_g)) {
	vsp = 2 * sign(grv);
	sprite_index = floating;
}