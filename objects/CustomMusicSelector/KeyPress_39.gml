if (index == 0) {
	new_music.weightM = min(new_music.weightM + 1, 4);
	SetSave(SV_MUS_MINI, new_music.weightM);
}

else if (index == 1) {
	new_music.weight8 = min(new_music.weight8 + 1, 4);
	SetSave(SV_MUS_8BIT, new_music.weight8);
}

else {
	new_music.weightE = min(new_music.weightE + 1, 4);
	SetSave(SV_MUS_EVIE, new_music.weightE);
}

WriteSaveFile();