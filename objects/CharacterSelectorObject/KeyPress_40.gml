if (!controllable) {
	exit;
}

back_selected = true;

if (selected) {
	t = 0;
	selected = false;
	selections[index].awkward();
}