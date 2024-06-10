if (selection == 0)
{
	selection = selection_maximum;
	subselection = 29;
}
else
{
	selection--;
	if (selection == 8 or selection == 7)
	{
		subselection = maxima[selection];
	}
	else
	{
		subselection -= 3;
	}
}