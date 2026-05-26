var _card_data = metas[DemoMenuState.menu_index];

if (keyboard_check_pressed(trigger_key) and script_execute(_card_data.requirement) and DemoMenuState.controllable) {
	
	determine_character();
	
	if (_card_data.lvl == Blank_Canvas) {
		SlideTransition(TRANS_MODE.GOTO, Blank_Canvas);
	}
	else if (array_length(_card_data.chr_select) == 2) {
		DemoMenuState.chars = _card_data.chr_select;
		SlideTransition(TRANS_MODE.CHAR_SELECT, Character_Select);
		global.level = _card_data.lvl;
	}
	else if (array_length(_card_data.chr_select) == 4) {
		DemoMenuState.chars = _card_data.chr_select;
		SlideTransition(TRANS_MODE.CHAR_SELECT, Character_Select_Starlight);
		global.level = _card_data.lvl;
	}	
	else {
		SlideTransition(TRANS_MODE.LEVEL, Level_Card);
		global.level = _card_data.lvl;
	}
}