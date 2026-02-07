delay = 6;
queue = 0;

make_pizza = function() {
	var _x = 17920;
	_x += random(96);
	
	instance_create_layer(_x, 17440, layer, Pizza);
}