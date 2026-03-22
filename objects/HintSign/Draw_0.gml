draw_self();

draw_sprite(arrow_spr, 0, x + 28, y + 16);

if (all_collected or check_all_collected()) {
	draw_sprite(spr_gsign_check, 0, x, y + 16);
}
else {
	draw_sprite(Gem_Rainbow, r_spr_index, x, y + 16);
}

if (r_spr_time >= r_spr_max_time) {
	r_spr_index++;
	r_spr_time = 0;
}


if (r_spr_index >= 28) {
	r_spr_index = 0;
}