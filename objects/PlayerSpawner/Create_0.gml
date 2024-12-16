var _layer = layer_get_id("Instances");

if (is_undefined(_layer)) {
	throw("Unable to find a layer called Instances! This is required to spawn the player!");
}

instance_create_layer(x, y, _layer, global.character);