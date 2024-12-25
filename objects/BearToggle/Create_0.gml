secret_gems = 0;
var secret = global.savedata[? "secret"];

for (var i = 0; i < ds_list_size(secret); i++) {
	if (secret[| i]) {
		secret_gems++;
	}
}

show_debug_message(global.savedata[? "secret accessed"]);
show_debug_message(secret_gems);

if (!global.savedata[? "secret accessed"] and secret_gems == 8) {
	PopupManager.notify(BearAlert, "secret accessed");
}