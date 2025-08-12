// set initial position
var _cursor_x = xDraw;
var _cursor_y = yDraw;

var _character_positions = [];
var _character_sprites = [];
var _current_position = 0;
var _total_width = 0;

if (drawCoin)
{
	draw_sprite_ext(CoinGUI, 0, 0, 0, 1.5, 1.5, 0, c_white, 1);		
}


for (var i = 1; i <= string_length(text); i++) {
	
	
	var _char = string_char_at(text, i);
			
	if (_char == " ") {
		_current_position += 50 * scale;
		array_push(_character_positions, 0);
		array_push(_character_sprites, font_);
		continue;
	}
			
	// get sprite information
	var _font_sprite = asset_get_index("font_" + _char);
	var _sprite_width = sprite_get_bbox_right(_font_sprite) - sprite_get_bbox_left(_font_sprite);
	var offset = 10;
	_sprite_width += offset;
	_sprite_width *= scale;
	
	// add to total width
	_total_width += _sprite_width;
	
	// push sprite information
	array_push(_character_sprites, _font_sprite);
	
	// remove the empty space to the left of the sprite
	var _left_space = sprite_get_bbox_left(_font_sprite) * scale;
	_current_position -= _left_space;
	
	// push the positional information
	array_push(_character_positions, _current_position);
	
	
	//draw the thing
	//draw_sprite_ext(_font_sprite, 0, _cursor_x, _cursor_y, scale, scale, 0, c_white, 1);
	_current_position += (_sprite_width + _left_space);
}

if (drawCoin) {
	_cursor_x -= _total_width / 2;
}
else if (align_right) {
	_cursor_x -= _total_width;
}

for (var i = 0; i < string_length(text); i++) {
	if (_character_sprites[i] != font_) {
		draw_sprite_ext(_character_sprites[i], 0, _cursor_x + _character_positions[i], _cursor_y, scale, scale, 0, c_white, 1);
	}
}