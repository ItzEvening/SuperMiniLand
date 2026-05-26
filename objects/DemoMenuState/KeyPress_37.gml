if (room != Demo_Menu) {
	exit;
}

var new_index = menu_index - 1;
new_index += max_menu_index + 1;
new_index %= max_menu_index + 1;
change_index(new_index);
dummy = 1;