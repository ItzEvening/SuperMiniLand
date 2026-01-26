if (index == 0) {
	new_music.weightM = min(new_music.weightM + 1, 4);
}

else if (index == 1) {
	new_music.weight8 = min(new_music.weight8 + 1, 4);
}

else {
	new_music.weightE = min(new_music.weightE + 1, 4);
}

WriteSaveFile();