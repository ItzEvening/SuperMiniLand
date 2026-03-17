/// @desc SlideTransition(mode, targetroom)
/// @arg _mode sets transition mode between next, restart, and goto
/// @arg _target sets target room for goto mode
function SlideTransition(_mode, _targetroom) {
	with (Transition)
	{
		mode = _mode;
		if (argument_count > 1) target = _targetroom;
	}	
}
