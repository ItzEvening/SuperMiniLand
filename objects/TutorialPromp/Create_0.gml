timer = time_source_global;

change_visibility = function() {
	visible = !visible;
	time_source_start(timer);
}

if (!GetSave(SV_TUTORIAL)) {
	sprite_index = New_Tutorial;
	timer = time_source_create(time_source_global, 1, time_source_units_seconds, change_visibility);
	time_source_start(timer);
}