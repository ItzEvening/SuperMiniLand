send_bouncer = function() {
	instance_create_layer(x, y, layer, BouncyObject, {
		chosen_path: path_CC4_s3,
		path_sp: 1.4,
	});
}

global.lo.add(self, SEND_BOUNCER, send_bouncer)