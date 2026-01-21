with (Player)
{
	if (hascontrol)
	{
		hascontrol = false;
		
		// manage save for levels without gems
		switch (room) {
			case Tutorial_E:
				SetSave(SV_TUTORIAL, true);
				WriteSaveFile();
			break;
			
			case Tutorial_AR:
				SetSave(SV_TUTORIAL_2, true);
				WriteSaveFile();
			break;
			
			case StarlightStation:
				SetSave(SV_STARLIGHT_BEAT, true);
				WriteSaveFile();
			break;
			
			case SpringIsland_Hard_1:
				SetSave(SV_SPRING_HARD_BEAT, true);
				WriteSaveFile();
			break;
			
			case SalmonPalace_Hard_Old:
				SetSave(SV_SALMON_HARD_BEAT, true);
				WriteSaveFile();
			break;
			
			case CanvasChallenge_2:
				var _cc = GetSave(SV_CANVAS_CHALLENGE);
				_cc[| 1] = true;
				WriteSaveFile();
			break;
			
			case CanvasChallenge_3:
				var _cc = GetSave(SV_CANVAS_CHALLENGE);
				_cc[| 2] = true;
				WriteSaveFile();
			break;
			
			case CanvasChallenge_5:
				var _cc = GetSave(SV_CANVAS_CHALLENGE);
				_cc[| 4] = true;
				WriteSaveFile();
			break;
		}
		
		// Manage targets and characters
		if (other.target == SecretSanctuary) {
			global.level = SecretSanctuary;
			SlideTransition(TRANS_MODE.LEVEL,Level_Card);
		}
		else if (other.target == Tutorial_E) {
			global.character = Evie;
			SlideTransition(TRANS_MODE.GOTO,other.target);
		}
		else if (other.target == Tutorial_AL) {
			global.character = Allie;
			SlideTransition(TRANS_MODE.GOTO,other.target);
		}
		else if (other.target == Tutorial_AR) {
			global.character = Arcturus;
			SlideTransition(TRANS_MODE.GOTO,other.target);
		}
		else {
			SlideTransition(TRANS_MODE.GOTO,other.target);
		}
	}
}