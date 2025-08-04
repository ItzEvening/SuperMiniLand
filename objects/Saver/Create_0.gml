// save the rainbow gems progress
key = "";

// decide which key to update
switch (global.level) {
	case SpringIsland_1:
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

// update the rainbow gems
if (key != "") {
	for (var i = 0; i < array_length(global.rainbow_progress); i++) {
		global.savedata[? key][| i] = global.rainbow_progress[i];
	}
}

WriteSaveFile();