draw_self();

sum = max(1, new_music.weightM + new_music.weight8 + new_music.weightE);

dx1 = 608 * (new_music.weightM / sum);
dx2 = 608 * (new_music.weight8 / sum);
dx3 = 608 * (new_music.weightE / sum);

draw_set_color(c_m);
draw_rectangle(x0, y1, x0 + dx1, y1 + 96, false);

draw_set_color(c_8);
draw_rectangle(x0, y2, x0 + dx2, y2 + 96, false);

draw_set_color(c_e);
draw_rectangle(x0, y3, x0 + dx3, y3 + 96, false);