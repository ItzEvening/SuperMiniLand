event_inherited();

right_border = 2018;

activate_custom = function() {
	boss_object.right_barrier = right_border;
	Player.right_barrier = right_border;
	Camera.change_right_border(right_border);	
}