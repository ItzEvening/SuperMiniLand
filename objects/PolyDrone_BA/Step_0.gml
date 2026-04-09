event_inherited();

x += flysp_x;
y += flysp_y;

if (t_follow >= t_follow_max) {
	t_follow = 0;
	
	var dx = Player.x - x;
	var dy = Player.y - y;
	var hyp = sqrt(dx * dx + dy * dy);
	
	flysp_x = flysp * (dx / hyp);
	flysp_y = flysp * (dy / hyp);
	
	image_xscale = -1 * sign(flysp_x);
}

t_follow++;