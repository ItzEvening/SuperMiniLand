bg_layer = layer_get_id("Background");
bg = layer_background_get_id(bg_layer);

if (global.bear) {
	layer_background_sprite(bg, A_Menu_Tile);
	sprite_index = Demo_Level_3;
}