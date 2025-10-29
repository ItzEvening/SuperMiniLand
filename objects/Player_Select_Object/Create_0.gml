var _layer = layer_get_id("Assets_1");
var _element = layer_sprite_get_id(_layer, "graphic_43E9E692");

if (GetSave(SV_EDGE_ARC)) {
	layer_sprite_change(_element, Ercturus_Idle);
}