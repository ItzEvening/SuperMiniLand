var _allie = instance_place(x, y, Allie);
var _forcefield = instance_place(x, y, o_Forcefield);

if (_allie != noone && _forcefield != noone && _allie.done_gimmick) {
	_allie.bounce(self, calculate_bounce_strength());
}