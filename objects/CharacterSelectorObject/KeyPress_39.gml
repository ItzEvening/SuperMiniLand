if (!controllable) {
	exit;
}

if (back_selected) {
	back_selected = false;
	index = num - 1;
	exit;
}

if (selected) {
	t = 0;
	selected = false;
	selections[index].awkward();
}

index++;
index %= num;