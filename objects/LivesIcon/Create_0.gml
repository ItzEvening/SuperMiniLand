show_chances = true;
sprite = MiniLivesIcon;
display = true;

toggle_draw = function(_d) {
	display = _d;
}

init = function(_player) {
	player = _player;
	
	switch (player) {
		case Evie:
			sprite = EvieLivesIcon;
		break;
		
		case Arcturus:
			sprite = ArtyLivesIcon;
		break;
		
		case Allie:
			sprite = AllieLivesIcon;
		break;
		
		case P_MetalNamey:
			sprite = MetalLivesIcon;
		break;
		
		case A_Allie:
			sprite = AlramechLivesIcon;
		break;
	}
}

set_show_chances = function(_show) {
	show_chances = _show;
}

global.lo.add(self, TOGGLE_GUI, toggle_draw);