// save the rainbow gems progress
key = "";

// decide which key to update
switch (global.level) {
	case SpringIsland_1:
		key = SV_GEM_SPRING;
	break;
	
	case SalmonPalace_1:
		key = SV_GEM_SALMON;
	break;
	
	case SecretSanctuary:
		key = SV_GEM_SECRET;
	break;
	
	case MidnightRush_1:
		key = SV_GEM_MIDNIGHT;
	break;
	
	case MarbleFortress_1:
		key = SV_GEM_MARBLE;
	break;
}

// update the rainbow gems
if (key != "") {
	for (var i = 0; i < array_length(global.rainbow_progress); i++) {
		GetSave(key)[| i] = global.rainbow_progress[i];
	}
}

WriteSaveFile();