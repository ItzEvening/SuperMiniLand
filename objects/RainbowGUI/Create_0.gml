gem_list = [];

// fetch the coin layer
var _coin_layer = layer_get_id("Coin");
if (_coin_layer == -1) {
	_coin_layer = layer_get_id("Gems");
}

var _layer_elements = layer_get_all_elements(_coin_layer);
var _index = 0;

lvl = "spring";
	
if (room == SalmonPalace_1) {
	lvl = "salmon";
}
else if (room == SecretSanctuary) {
	lvl = "secret";
}

// retrive all the rainbow gem instances
for (var i = 0; i < array_length(_layer_elements); i++) {
	if (layer_get_element_type(_layer_elements[i]) == layerelementtype_instance) {
	
		
		var _instance = layer_instance_get_instance(_layer_elements[i]);
		
		if (_instance.object_index == CoinR) {
			array_push(gem_list, _instance);
			
			// make gems faded if collected
			if (global.savedata[? lvl][| _index]) {
				_instance.image_alpha = 0.25;
			}
			
			_index++;
		}
	}
}