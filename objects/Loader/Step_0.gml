t += delta_time / 1000000;
t_total += delta_time / 1000000;

if (t > 0.2 and !proceed and TextureGroupManager.all_fetched()) {
	Transition.mode = TRANS_MODE.GOTO_LOADED;
	show_debug_message($"Load complete in {t_total} seconds!");
}