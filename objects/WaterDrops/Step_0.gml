event_inherited();

if (y > room_height + 32 || abs(original_y - y) > max_height) {
	sprite_index = spr_BarrelWater_Die;
}
else if (sprite_index == spr_BarrelWater) {
	vsp = 9 * sign(grv);
}