frame = 0;
sprite = HP_Player_M;

offset = 0;

if (global.bear) {
	offset = 32;
}


function lifetoframe (_life){
	if (global.bear) {
		_life++;
	}
	
	if (_life >= 3){
		frame = 0;
	}
	else {
		frame = 3 - _life;
	}
}