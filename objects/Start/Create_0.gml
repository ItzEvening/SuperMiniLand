/// @description Insert description here
// You can write your code in this editor
change_visibility = function()
{
	visible = !visible;
}

timer = time_source_create(time_source_global, 0.75, time_source_units_seconds, change_visibility, [], -1);
time_source_start(timer);