with (Player)
{
	if (hascontrol)
	{
		show_debug_message("really?");
		hascontrol = false;
		SlideTransition(TRANS_MODE.NEXT);
		//SlideTransition(TRANS_MODE.GOTO,target);
	}
}