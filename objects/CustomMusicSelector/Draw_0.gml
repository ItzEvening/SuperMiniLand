draw_self();

sum = max(1, new_music.weightM + new_music.weight8 + new_music.weightE);

dx1 = 640 * (new_music.weightM / sum);
dx2 = 640 * (new_music.weight8 / sum);
dx3 = 640 * (new_music.weightE / sum);


var _spr0 = asset_get_index("font_" + string(global.music.weightM));
var _spr1 = asset_get_index("font_" + string(global.music.weight8));
var _spr2 = asset_get_index("font_" + string(global.music.weightE));

draw_sprite(_spr0, 0, 96, y1);
draw_sprite(_spr1, 0, 96, y2);
draw_sprite(_spr2, 0, 96, y3);

draw_set_color(c_m);
draw_rectangle(x0, y1, x0 + dx1, y1 + 4 * 32, false);

draw_set_color(c_8);
draw_rectangle(x0, y2, x0 + dx2, y2 + 4 * 32, false);

draw_set_color(c_e);
draw_rectangle(x0, y3, x0 + dx3, y3 + 4 * 32, false);