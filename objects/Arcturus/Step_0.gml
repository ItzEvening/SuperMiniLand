event_inherited();

var _gimmick = hit_jump_hold();

var _norm_g = vsp > 2 and sign(grv) == 1;
var _rev_g = vsp < -2 and sign(grv) == -1;

if (_gimmick and (_norm_g or _rev_g)) {
	vsp = 2 * sign(grv);
}