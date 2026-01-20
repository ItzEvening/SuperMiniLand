if (chosen_path != undefined) {
	
	if (sync) {
		path_sp = (path_get_length(chosen_path) / sync_len) * sync_time;
	}
	path_start(chosen_path, path_sp, path_action_reverse, false);
}