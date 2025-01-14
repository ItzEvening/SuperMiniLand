// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function s_handle_death(){
	if (chances == 0)
	{
		SlideTransition(TRANS_MODE.GOTO, Game_Over);
	}
	else if (chances == 1)
	{
		timer = time_source_create(time_source_global, 0.75, time_source_units_seconds, change_visibility, [], -1);
		time_source_start(timer);
	}
	
	if (chances > 0) {
		chances--;
		
	}
	
	hp = hp_default;
	hpgui.lifetoframe(hp);
	//change_life(3);
	x = original_x;
	y = original_y;
	hsp = 0;
	vsp = 0;
}