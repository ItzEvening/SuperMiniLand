// Update destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

// Update object position
x += (xTo - x) / 5;
y += (yTo - y) / 5;

// Clamp coordinates so it doesn't leave border
x = clamp(x, left_border + view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

// Shake 
var _x_offset = 0;
var _y_offset = 0;
if (shaking) {
	_x_offset = random(6) - 3;
	_y_offset = random(6) - 3;
}

// Update camera view
camera_set_view_pos(cam, x - view_w_half + _x_offset , y - view_h_half + _y_offset);

// Parallax
for (var i = 0; i < array_length(background_list); i++)
{
	var _layer_name = layer_get_name(background_list[i]);
	var _parallax_value = parallax_values[? _layer_name];
	
	
	if (_parallax_value != 0)
	{
		layer_x(background_list[i], x / _parallax_value);
	}
}