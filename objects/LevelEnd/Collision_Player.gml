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