global.bear = !global.bear;

if (global.bear) {
	layer_background_sprite(bg, A_Menu_Tile);
}
else {
	layer_background_sprite(bg, New_Menu_Tile);
}