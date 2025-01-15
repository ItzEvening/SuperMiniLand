// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function s_change_life(_delta){
	if (hp == 0 and _delta < 0) {
		handle_death();
	}
	
	else {
		hp += _delta;
		hpgui.lifetoframe(hp);
	}
	
	if (_delta < 0) {
		reset_iframe();
	}
	
}