room_dependencies = ds_map_create();
room_dependencies[? Main_Menu] = ["ResetGroup"];
room_dependencies[? Main_Menu_2] = ["ResetGroup"];
room_dependencies[? Main_Menu_3] = ["ResetGroup"];
room_dependencies[? Demo_Menu] = ["LvlSelect", "MusicGroup"];
room_dependencies[? Sound_Select] = ["MusicGroup"];
room_dependencies[? Sound_Select_Custom] = ["MusicGroup"];

room_dependencies[? SpringIsland_1] = ["SpringIslandGroup"];
room_dependencies[? MarbleFortress_1] = ["MarbleFortressGroup"];
room_dependencies[? SecretSanctuary] = ["SecretSanctuaryGroup"];
room_dependencies[? StarlightStation] = ["StarlightStationGroup"];

room_dependencies[? Blank_Canvas] = ["BlankCanvasGroup"];
room_dependencies[? Hard_Blank_Canvas] = ["BlankCanvasGroup"];
room_dependencies[? CanvasChallenge_1] = ["SpringIslandGroup"];
room_dependencies[? CanvasChallenge_3] = ["MarbleFortressGroup"];
room_dependencies[? CanvasChallenge_5] = ["CC5Group"];

textures = [];

discard_unneeded_textures = function(new_textures) {
	var i = 0;
	
	while (i < array_length(textures)) {
		var texture = textures[i];
		
		if (array_contains(new_textures, texture)) {
			i++;
		}
		
		else {
			show_debug_message($"Unloading texture group {texture}");
			texture_flush(texture);
			texturegroup_unload(texture);
			array_delete(textures, i, 1);
		}
	}
}

discard_all_textures = function() {
	var i = 0;
	
	while (i < array_length(textures)) {
		var texture = textures[i];
		
		show_debug_message($"Unloading texture group {texture}");
		texture_flush(texture);
		texturegroup_unload(texture);
		array_delete(textures, i, 1);
	}	
}

add_textures = function(new_textures) {
	
	for (var i = 0; i < array_length(new_textures); i++) {
		var texture = new_textures[i];
		
		if (!array_contains(textures, texture)) {
			show_debug_message($"Loading texture group {texture}");
			texturegroup_load(texture);
			array_push(textures, texture);
		}
	}
}

transition_room = function(new_room) {
	if (!ds_map_exists(room_dependencies, new_room)) {
		discard_all_textures();
		return;
	}
	
	var new_textures = room_dependencies[? new_room];
	discard_unneeded_textures(new_textures);
	add_textures(new_textures);
}

all_fetched = function() {
	for (var i = 0; i < array_length(textures); i++) {
		
		var texture = textures[i];
		var status = texturegroup_get_status(texture);
		
		if (status != texturegroup_status_fetched) {
			return false;
		}
	}
	
	return true;
}