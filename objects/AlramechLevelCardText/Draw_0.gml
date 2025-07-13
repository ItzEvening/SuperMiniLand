var color = c_white;
if (global.level == CircleCastle_3) {
	color = c_red;
}

draw_set_color(color);
draw_set_font(GameFont_1);
draw_set_valign(fa_middle)
draw_set_halign(fa_left)
draw_text(x-110,y-50,text_to_draw);
draw_text_transformed(x+80,y-50,Stage_Num,2,2,0);