if (index == 0) {
	new_music.weightM = max(new_music.weightM - 1, 0);
}

else if (index == 1) {
	new_music.weight8 = max(new_music.weight8 - 1, 0);
}

else {
	new_music.weightE = max(new_music.weightE - 1, 0);
}

WriteSaveFile();