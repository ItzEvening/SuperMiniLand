update = function() {
	image_index = DemoMenuState.menu_index;
}

global.lo.add(self, MENU_CHANGE, update);

update();