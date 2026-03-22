all_collected = false;
arrow_spr = spr_gsign_right;

if (global.difficulty != 0) {
	instance_destroy();
}

check_all_collected = function() {
	for (var i = 0; i < array_length(gems); i++) {
		var g = gems[i];
		
		if (!RainbowGUI.gem_list[g].collected and !global.rainbow_progress[g]) {
			return false;
		}
		
	}
	
	all_collected = true;
	return true;
}

switch (dir) {
	case "RIGHT":
	arrow_spr = spr_gsign_right;
	break;
	
	case "LEFT":
	arrow_spr = spr_gsign_left;
	break;
	
	case "UP":
	arrow_spr = spr_gsign_up;
	break;
	
	case "DOWN":
	arrow_spr = spr_gsign_down;
	break;	
}