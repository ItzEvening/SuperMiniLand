// set initial position
var _cursor_x = 100;
var _cursor_y = 100;
		
		
for (var i = 1; i <= string_length(text); i++) {
	var _char = string_char_at(text, i);
			
	if (_char == " ") {
		_cursor_x += 50 * scale;
		continue;
	}
			
	// get sprite information
	var _font_sprite = asset_get_index("font_" + _char);
	var _sprite_width = sprite_get_bbox_right(_font_sprite) - sprite_get_bbox_left(_font_sprite);
	var offset = 10;
	_sprite_width += offset;
	_sprite_width *= scale;
	
	// remove the empty space to the left of the sprite
	var _left_space = sprite_get_bbox_left(_font_sprite) * scale;;
	_cursor_x -= _left_space;
			
	//draw the thing
	draw_sprite_ext(_font_sprite, 0, _cursor_x, _cursor_y, scale, scale, 0, c_white, 1);
	_cursor_x += _sprite_width + _left_space;
}