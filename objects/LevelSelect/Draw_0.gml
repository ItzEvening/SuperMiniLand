/// @description Insert description here
// You can write your code in this editor
draw_clear(#ffffff);
var _rect_sub = subselection_list[subselection];
var _rect_sel = selection_list[selection];

var _dim_sub = rectangle_map[? _rect_sub.recttype];
var _dim_sel = rectangle_map[? _rect_sel.recttype];

draw_rectangle_color(_rect_sub.x, _rect_sub.y, _rect_sub.x + _dim_sub.width, _rect_sub.y + _dim_sub.height, #a8008c, #a8008c, #a8008c, #a8008c, false);
draw_rectangle_color(_rect_sel.x, _rect_sel.y, _rect_sel.x + _dim_sel.width, _rect_sel.y + _dim_sel.height, #a8008c, #a8008c, #a8008c, #a8008c, false);