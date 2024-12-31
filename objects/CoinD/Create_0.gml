activated = true;
collected = false;

activate = function() {
	activated = true;
	visible = true;
	collected = true;
}

timer = time_source_create(time_source_global, 3, time_source_units_seconds, activate);