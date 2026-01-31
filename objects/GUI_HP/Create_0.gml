frame = 0;
sprite = HP_Player_M;
max_hp = 3
display = true;

render_x = view_wport[0] + 1;
show_debug_message(render_x);
render_y = 0;
render_scale = 1.5;

toggle_draw = function(_d) {
	display = _d;
}

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
			max_hp = 2;
		break;
		
		case Arcturus:
			sprite = HP_Player_Ar;
			max_hp = 2;
		break;
		
		case P_MetalNamey:
			sprite = HP_Player_Mt;
			max_hp = 7;
		break;
		
		case P_Minomay:
			sprite = HP_Player_Mo;
			max_hp = 7;
		break;
		
		case A_Allie:
			sprite = HP_Player_Aa;
			max_hp = 2;
			render_y = 880;
			render_scale = 2;
		break;
	}
}

function lifetoframe (_life){
	frame = max_hp - _life;
}

global.lo.add(self, TOGGLE_GUI, toggle_draw);