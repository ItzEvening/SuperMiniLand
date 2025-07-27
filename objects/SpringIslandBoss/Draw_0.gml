draw_self();
// draw_sprite(PolyGuy, 0, x + 14, y);
var _offset_x = -2 * scale;
var _offset_y = -15 * scale;

draw_sprite_ext(PolyGuy, get_frame_index(frame), x + _offset_x, y + _offset_y, jump_direction * scale, scale, 0, c_white, 1);