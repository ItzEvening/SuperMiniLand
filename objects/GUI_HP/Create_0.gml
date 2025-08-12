frame = 0;
sprite = HP_Player_M;
bear = false;

render_x = 1200;
render_y = 0;
render_scale = 1.5;

function init(_type) {
	switch (_type) {
		
		case Mini:
			sprite = HP_Player_M;
		break;
		
		case Evie:
			sprite = HP_Player_E;
		break;
		
		case Allie:
			sprite = HP_Player_Al;
			bear = true;
		break;
		
		case Arcturus:
			sprite = HP_Player_Ar;
			bear = true;
		break;
		
		case A_Allie:
			sprite = HP_Player_Aa;
			bear = true;
			render_y = 880;
			render_scale = 2;
		break;
	}
}

function lifetoframe (_life){
	if (bear) {
		_life++;
	}
	
	if (_life >= 3){
		frame = 0;
	}
	else {
		frame = 3 - _life;
	}
}