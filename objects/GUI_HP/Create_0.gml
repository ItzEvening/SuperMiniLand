frame = 0;
sprite = HP_Player_M;
bear = false;

offset = 0;

if (bear) {
	offset = 32;
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