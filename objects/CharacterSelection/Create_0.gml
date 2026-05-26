locked = false;

idle_spr = Mini_Idle;
chosen_spr = Mini_Chosen;
awkward_spr = Mini_Awkward;

switch (DemoMenuState.chars[index]) {
	case Evie:
		idle_spr = Eve_Idle;
		chosen_spr = Eve_Chosen;
		awkward_spr = Eve_Awkward;
		break;
	case Arcturus:
		if (GetSave(SV_EDGE_ARC)) {
			idle_spr = Ercturus_Idle;
			chosen_spr = Ercturus_Chosen;
			awkward_spr = Ercturus_Awkward;			
		}
		
		else {
			idle_spr = Arcturus_Idle;
			chosen_spr = Arcturus_Chosen;
			awkward_spr = Arcturus_Awkward;			
		}
		
		break;
	case Allie:
		idle_spr = Allie_Idle;
		chosen_spr = Allie_Chosen;
		awkward_spr = Allie_Awkward;
		break;
	case P_MetalNamey:
		idle_spr = M_Mini_Idle;
		chosen_spr = M_Mini_Chosen;
		awkward_spr = M_Mini_Awkward;
		break;
	case P_Minomay:
		idle_spr = Mino_Idle;
		chosen_spr = Mino_Chosen;
		awkward_spr = Mino_Awkward;
		break;
}

sprite_index = idle_spr;

t_awk = 0;

chose = function() {
	t_awk = 0;
	sprite_index = chosen_spr;
}

awkward = function() {
	t_awk = 1.5;
	sprite_index = awkward_spr;
}

var bear = DemoMenuState.chars[index] == Arcturus or DemoMenuState.chars[index] == Allie;
if (bear and !GetSave(SV_BEARS_UNLOCKED)) {
	sprite_index = CharacterLock;
	locked = true;
}