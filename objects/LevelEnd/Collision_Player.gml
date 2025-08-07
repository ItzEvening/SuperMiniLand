with (Player)
{
	if (hascontrol)
	{
		hascontrol = false;
		
		// manage tutorial save
		if (room == Tutorial_E and !GetSave("secret accessed")) {
			SetSave(SV_TUTORIAL, true);
			WriteSaveFile();
		}
		else if (room == Tutorial_AR) {
			SetSave(SV_TUTORIAL, true);
			WriteSaveFile();
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