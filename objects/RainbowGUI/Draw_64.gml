
for (var i = 0; i < array_length(gem_list); i++) {
	
	var spr = rgem_0;
	
	if (gem_list[i].collected || global.rainbow_progress[i]) {
		var num = i + 1;
		spr = asset_get_index("rgem_" + string(num));
		
		
		// save collected
		if (!global.rainbow_progress[i]) {
			global.rainbow_progress[i] = true;
		}
	}
	
	draw_sprite(spr, 0, 150 + 70 * i, 10);
}