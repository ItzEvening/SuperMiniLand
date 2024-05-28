with (Player)
{
	if (hascontrol)
	{
		show_debug_message("sex");
		hascontrol = false;
		SlideTransition(TRANS_MODE.GOTO,Test_SpringIsland);
	}
}