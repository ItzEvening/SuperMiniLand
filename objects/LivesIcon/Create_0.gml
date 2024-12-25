player = noone;
sprite = MiniLivesIcon;


init = function(_player) {
	player = _player;
	
	switch (global.character) {
		case Evie:
			sprite = EvieLivesIcon;
		break;
		
		case Arcturus:
			sprite = ArtyLivesIcon;
		break;
		
		case Allie:
			sprite = AllieLivesIcon;
		break;
	}
}



