
draw_set_color(c_white);
draw_set_font(GameFont);
draw_set_valign(fa_middle)
draw_set_halign(fa_left)
draw_text(x + x_offset,y + y_offset,text_to_draw);


// stage num
draw_set_halign(fa_center);
draw_text_transformed(x+170,y-50,Stage_Num,2,2,0);
draw_set_halign(fa_left);