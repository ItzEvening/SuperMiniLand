frame = 0;

sprite = HP_Player_M;



function lifetoframe (_life){
	if (_life >= 3){
		frame = 0;
	}
	else {
		frame = 3 - _life;
	}
}