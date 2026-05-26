if (!controllable) {
	exit;
}

if (back_selected) {
	back_selected = false;
	index = 0;
	exit;
}

if (selected) {
	t = 0;
	selected = false;
	selections[index].awkward();
}

index--;
index += num;
index %= num;