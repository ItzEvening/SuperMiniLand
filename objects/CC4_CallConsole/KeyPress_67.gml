if (displaying) {
	if (index == 0) {
		displaying = false;
		CC4_DialogueBox.load(0);
		sprite_index = spr_CC4_console_arty;
	}

	else if (index == 1) {
		displaying = false;
		CC4_DialogueBox.order_pizza();
		sprite_index = spr_CC4_console_pizza;
	}
}

