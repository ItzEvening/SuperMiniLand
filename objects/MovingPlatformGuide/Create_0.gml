custom_path = false;

if (p_index != 0) {
	path_to_follow = path_duplicate(path_to_follow);
	RotatePath(path_to_follow, p_index);
	custom_path = true;
}

path_start(path_to_follow, path_sp, path_action_continue, false);