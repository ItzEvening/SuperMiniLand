var _phy = instance_place(x, y, PhysicsBody);
if (_phy != noone and sprite_index == spr_BarrelWater) {
	_phy.water_stream_callback();
}