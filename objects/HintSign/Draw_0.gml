draw_self();

draw_sprite(arrow_spr, 0, x + 28, y + 16);

if (all_collected or check_all_collected()) {
	draw_sprite(spr_gsign_check, 0, x, y + 16);
}
else {
	draw_sprite(Gem_Rainbow, 0, x, y + 16);
}