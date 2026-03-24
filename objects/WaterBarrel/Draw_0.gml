draw_self();

if (sprite_index == spr_Barrel_Pour and image_index >= 8 and !poured) { 
	instance_create_layer(x, y + 32, layer_get_id("Checkpoints"), WaterDrops, {
		original_y: y
	});	
	
	poured = true;
}