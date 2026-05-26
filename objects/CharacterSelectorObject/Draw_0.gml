if (back_selected) {
	var left_x = CharacterSelectorExit.x - 120;
	var right_x = CharacterSelectorExit.x + 120;
	
	draw_sprite_ext(spr_CharSelector, 0, left_x, CharacterSelectorExit.y, 1, 1, 270, c_white, 1);
	draw_sprite_ext(spr_CharSelector, 0, right_x, CharacterSelectorExit.y, 1, 1, 90, c_white, 1);
}
else {
	draw_sprite(spr_CharSelector, 0, selections[index].x, selections[index].y + selector_y_offset);
}

