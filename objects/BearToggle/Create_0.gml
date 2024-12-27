secret_gems = 0;
enable_toggle = false;

var secret = global.savedata[? "secret"];

for (var i = 0; i < ds_list_size(secret); i++) {
	if (secret[| i]) {
		secret_gems++;
	}
}

if (secret_gems == 8)
{
	enable_toggle = true;
}

if (!global.savedata[? "secret accessed"] and enable_toggle) {
	global.savedata[? "tutorial"] = false;
	PopupManager.notify(BearAlert, "secret accessed");
}

if (enable_toggle) {
	
	if (global.bear) {
		image_index = 2;
	}
	else {
		image_index = 1;
	}
	
	
	// handle the a press key asset
	var _layer = layer_get_id("Assets_1");
	layer_sprite_create(_layer, 1324, 1140, A_Press);
}