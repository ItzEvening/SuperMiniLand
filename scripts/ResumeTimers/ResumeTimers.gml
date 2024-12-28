function ResumeTimers(_time_source){
	var _children = time_source_get_children(_time_source);
	
	for (var i = 0; i < array_length(_children); i++) {
		ResumeTimers(_children[i]);
	}
	
	if (_time_source != time_source_global and _time_source != time_source_game) {
		time_source_resume(_time_source);
	}
}