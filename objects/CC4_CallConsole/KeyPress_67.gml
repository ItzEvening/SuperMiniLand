if (displaying) {
	if (index == 0) {
		displaying = false;
		
		if (Allie.raging) {
			CC4_DialogueBox.load(10);
			
		} else {
			CC4_DialogueBox.load(0);
		}
		
		sprite_index = spr_CC4_console_arty;
	}

	else if (index == 1) {
		displaying = false;
		
		if (Allie.raging) {
			CC4_DialogueBox.order_pizza(10);
		}
		else {
			CC4_DialogueBox.order_pizza(1);
		}
		
		sprite_index = spr_CC4_console_pizza;
	}
	
	else if (index == 2) {
		displaying = false;
		
		if (Allie.raging) {
			CC4_DialogueBox.emergency = true;
			CC4_DialogueBox.load(12);
			
		} else {
			CC4_DialogueBox.load(2);
		}		
		
		sprite_index = spr_CC4_console_poly;
	}
	
	else if (index == 3 and got_sus_contact) {
		displaying = false;
		CC4_DialogueBox.prank = true;
		CC4_DialogueBox.load(3);
		sprite_index = spr_CC4_console_unknown;
		MusicPlayer.stop_music();
	}
	
	else if (index == 4) {
		displaying = false;
		CC4_DialogueBox.emergency = true;
		CC4_DialogueBox.load(4);
		sprite_index = spr_CC4_console_emergency;		
	}
}

