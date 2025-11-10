si_icon = Icon_gray_SpringIsland;
sp_icon = Icon_gray_SalmonPalace;

_x = 1201 - 128;
_y = 880 - 128;

if (GetSave(SV_SPRING_HARD_BEAT)) {
	si_icon = Icon_SpringIsland;
}

if (GetSave(SV_SALMON_HARD_BEAT)) {
	sp_icon = Icon_SalmonPalace;
}