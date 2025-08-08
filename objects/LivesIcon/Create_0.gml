player = noone;
sprite = MiniLivesIcon;


init = function(_player) {
	player = _player;
	
	switch (player.object_index) {
		case Evie:
			sprite = EvieLivesIcon;
		break;
		
		case Arcturus:
			sprite = ArtyLivesIcon;
		break;
		
		case Allie:
			sprite = AllieLivesIcon;
		break;
		
		case A_Allie:
			sprite = AlramechLivesIcon;
		break;
	}
}



