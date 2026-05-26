menu_index = 0;
max_menu_index = 4;
controllable = true;
dummy = 2;
chars = [Mini, Evie];

change_index = function(index) {
	menu_index = index;
	global.lo.send(MENU_CHANGE,);
}