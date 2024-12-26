with (Player)
{
	if (hascontrol)
	{
		hascontrol = false;
		//SlideTransition(TRANS_MODE.NEXT);
		
		if (other.target == SecretSanctuary) {
			global.level = SecretSanctuary;
			SlideTransition(TRANS_MODE.LEVEL,Level_Card);
		}
		else if (other.target == Tutorial_E) {
			global.character = Evie;
			SlideTransition(TRANS_MODE.LEVEL,other.target);
		}
		else {
			SlideTransition(TRANS_MODE.GOTO,other.target);
		}
	}
}