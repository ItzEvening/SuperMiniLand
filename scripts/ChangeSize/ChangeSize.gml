/// @func ChangeSize(_width, _height)
/// @desc Changes the window size and application surface size. For CC5, for example.
/// @param {Real} width   New application width
/// @param {Real} height  New application height
function ChangeSize(_width, _height){
	surface_resize(application_surface, _width, _height);
	
	if(window_get_width() < _width or window_get_height() < _height) {
		window_set_size( _width, _height );
	}
}