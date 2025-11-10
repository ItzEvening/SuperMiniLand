
for (var i = 0; i < array_length(global.rainbow_progress); i++) {
	
	var spr = rgem_0;
	var _collected = (i < array_length(gem_list)) && (gem_list[i].collected);
	
	if (global.rainbow_progress[i] || _collected) {
		var num = i + 1;
		spr = asset_get_index(prefix + string(num));
		
		
		// save collected
		if (!global.rainbow_progress[i]) {
			global.rainbow_progress[i] = true;
		}
	}
	
	draw_sprite(spr, 0, 150 + 70 * i, 10);
}