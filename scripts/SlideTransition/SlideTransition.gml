/// @desc SlideTransition(mode, targetroom)
/// @arg mode sets transition mode between next, restart, and goto
/// @arg target sets target room for goto mode

with (Transition)
{
	mode = argument[0];
	if (argument_count > 1) target = argument[1];
}