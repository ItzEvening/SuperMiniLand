if (displaying) {
	draw_sprite(sprite_board, 0, gui_x, gui_y);
	
	// draw small icons
	for (var i = 0; i < 6; i++) {
		draw_sprite(sprites[i], 0, gui_x + 12, gui_y + 12 + 84 * i);
	}
	
	// draw big icon
	draw_sprite_ext(sprites[index], 0, gui_x + 267, gui_y + 28, 4, 4, 0, c_white, 1);
	
	
	// press C
	if (index != 3 or got_sus_contact) {
		draw_sprite(spr_CC4_press_c, 0, gui_x + 274, gui_y + 415);
	}
	
	// text
	draw_sprite(sprites_text[index], 0, gui_x + 203, gui_y + 302);
}