index = 0;

global.music.custom = true;
new_music = global.music;

y1 = 176;
y2 = 496;
y3 = 848;
x0 = 848;

c_m = make_color_rgb(224, 32, 128);
c_8 = make_color_rgb(200, 68, 156);
c_e = make_color_rgb(66, 66, 100);

// numbers
number_layer = layer_get_id("Numbers");
num_mini = layer_sprite_get_id(number_layer, "num_mini");
num_8bit = layer_sprite_get_id(number_layer, "num_8bit");
num_evie = layer_sprite_get_id(number_layer, "num_evie");

// arrow
arrow_layer = layer_get_id("Arrows");
arr_l_m = layer_sprite_get_id(arrow_layer, "arrow_mini_left");
arr_l_8 = layer_sprite_get_id(arrow_layer, "arrow_8bit_left");
arr_l_e = layer_sprite_get_id(arrow_layer, "arrow_evie_left");
arr_r_m = layer_sprite_get_id(arrow_layer, "arrow_mini_right");
arr_r_8 = layer_sprite_get_id(arrow_layer, "arrow_8bit_right");
arr_r_e = layer_sprite_get_id(arrow_layer, "arrow_evie_right");

update_position = function() {
	if (index == 0) {
		y = 128;
	}

	else if (index == 1) {
		y = 480;
	}

	else {
		y = 832;
	}
}

update_numbers = function() {
	var _spr_m = asset_get_index("font_" + string(global.music.weightM));
	var _spr_8 = asset_get_index("font_" + string(global.music.weight8));
	var _spr_e = asset_get_index("font_" + string(global.music.weightE));
	
	layer_sprite_change(num_mini, _spr_m);
	layer_sprite_change(num_8bit, _spr_8);
	layer_sprite_change(num_evie, _spr_e);
}

update_arrows = function() {
	var _spr_m_l = spr_GreenArrow;
	var _spr_8_l = spr_GreenArrow;
	var _spr_e_l = spr_GreenArrow;
	var _spr_m_r = spr_GreenArrow;
	var _spr_8_r = spr_GreenArrow;
	var _spr_e_r = spr_GreenArrow;
	
	if (new_music.weightM == 0) {
		_spr_m_l = spr_InactiveArrow;
	} 
	else if (new_music.weightM == 4) {
		_spr_m_r = spr_InactiveArrow;
	}
	
	if (new_music.weight8 == 0) {
		_spr_8_l = spr_InactiveArrow;
	} 
	else if (new_music.weight8 == 4) {
		_spr_8_r = spr_InactiveArrow;
	}
	
	if (new_music.weightE == 0) {
		_spr_e_l = spr_InactiveArrow;
	} 
	else if (new_music.weightE == 4) {
		_spr_e_r = spr_InactiveArrow;
	}
	
	layer_sprite_change(arr_l_m, _spr_m_l);
	layer_sprite_change(arr_l_8, _spr_8_l);
	layer_sprite_change(arr_l_e, _spr_e_l);
	layer_sprite_change(arr_r_m, _spr_m_r);
	layer_sprite_change(arr_r_8, _spr_8_r);
	layer_sprite_change(arr_r_e, _spr_e_r);
}

update_position();
update_numbers();
update_arrows();

SetSave(SV_MUS_CONFIG, 3);
WriteSaveFile();