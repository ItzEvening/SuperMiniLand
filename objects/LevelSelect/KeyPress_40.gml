if (selection == selection_maximum)
{
	selection = 0;
	subselection = 0;
}
else
{
	selection++;
	if (selection == 9 or subselection == 8)
	{
		subselection = minima[selection];
	}
	else
	{
		subselection += 3;
	}
}