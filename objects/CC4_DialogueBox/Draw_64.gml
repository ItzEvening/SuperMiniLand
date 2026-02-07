if (display) {
	draw_sprite(spr_CC4_dialogue_box, 0, 39, 545);
	draw_sprite_ext(spr, 0, 63, 569, 4, 4, 0, c_white, 1);
	draw_set_font(DialogueFont);
	draw_set_valign(fa_top);
	draw_text_color(378, 570, text, color, color, color, color, 1);
	
	if (progressable) {
		draw_sprite(spr_CC4_c, 0, 675, 496);
	}
}

// 675 496