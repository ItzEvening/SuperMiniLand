var _layer = layer_get_id("Assets_1");

if (global.savedata[? "bears unlocked"]) {
	var arty = layer_sprite_create(_layer, 423, 748, Arcturus_Hang);
	layer_sprite_xscale(arty, 6);
	layer_sprite_yscale(arty, 6);
	
	var allie = layer_sprite_create(_layer, 219, 899.3, Allie_Sit);
	layer_sprite_xscale(allie, 6.1562);
	layer_sprite_yscale(allie, 5.7812);
	
}
if (global.savedata[? "boss unlocked"]) {
	var poly = layer_sprite_create(_layer, 1600, 704, Poly_Flex);
	layer_sprite_xscale(poly, -8.5);
	layer_sprite_yscale(poly, 9);
	
	var car = layer_sprite_create(_layer, 1056, 768, PolyCar);
	layer_sprite_xscale(car, 4.5);
	layer_sprite_yscale(car, 4);
}