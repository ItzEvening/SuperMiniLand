if (t_awk > 0) {
	t_awk = max(0, t_awk - delta_time / 1000000);
}


if (t_awk == 0 and sprite_index == awkward_spr) {
	sprite_index = idle_spr;
}