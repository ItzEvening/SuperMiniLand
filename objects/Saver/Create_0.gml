// save the rainbow gems progress
key = "";

switch (global.level) {
	case SpringIsland__1:
		key = "spring";
	break;
	
	case SalmonPalace_1:
		key = "salmon";
	break;
	
	case SecretSanctuary:
		key = "secret";
	break;
	
	case MidnightRush_1:
		key = "midnight";
	break;
	
	case MarbleFortress_1:
		key = "marble";
	break;
}

if (key != "") {
	for (var i = 0; i < array_length(global.rainbow_progress); i++) {
		global.savedata[? key][| i] = global.rainbow_progress[i];
	}
}

ds_map_secure_save(global.savedata, "save");