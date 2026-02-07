enabled = true;
displaying = false;
index = 0;
got_sus_contact = false;

gui_x = 275;
gui_y = 186;

sprite_board = spr_CC4_board;
sprites = [spr_CC4_arty, spr_CC4_pizza, spr_CC4_poly, spr_CC4_empty, spr_CC4_emergency, spr_CC4_exit];
sprites_text = [spr_CC4_text_arty, spr_CC4_text_pizza, spr_CC4_text_poly, spr_CC4_text_empty, spr_CC4_text_emergency];

sus = function() {
	got_sus_contact = true;
	sprites[3] = spr_CC4_unknown;
	sprites_text[3] = spr_CC4_text_unknown;
}