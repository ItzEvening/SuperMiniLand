if (sprite_index == spr_Barrel_Pour) {
	image_speed = 0;
	sprite_index = spr_Barrel;
	instance_create_layer(x, y + 32, layer, WaterDrops);
}