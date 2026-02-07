if (display) {
	
	
	if (delay == 0) {
		
		if (text_progress < target_progress) {
			update_text();
		}
		
		delay = 3;
	}
	
	else {
		delay--;
	}
}