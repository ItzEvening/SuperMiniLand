cam = view_camera[0];
follow = Player;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;

#region Parallax Stuff
parallax_values = ds_map_create();
background_list = [];

var _parallax_json = JSONHelper("parallax.json");
var _parallax_list = _parallax_json.Parallax;

var _layers = layer_get_all();


// Fills in map keys and background list
for (var i = 0; i < array_length(_layers); i++)
{
	var _elements = layer_get_all_elements(_layers[i]);
	
	// if the layer is a background layer
	if (layer_get_element_type(_elements[0]) == layerelementtype_background)
	{
		var _layer_name = layer_get_name(_layers[i]);
		
		array_push(background_list, _layers[i]);
		parallax_values[? _layer_name] = 0;
	}
	
}

// Iterates over the JSON to assign the correct values in the map
for (var i = 0; i < array_length(_parallax_list); i++)
{
	var _parallax = _parallax_list[i];
	var _parallax_name = _parallax.Background;
	var _parallax_value = _parallax.Value;
	
	if (ds_map_exists(parallax_values, _parallax_name))
	{
		ds_map_replace(parallax_values, _parallax_name, _parallax_value);
	}
}
#endregion