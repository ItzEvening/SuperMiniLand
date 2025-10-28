event_inherited();

var _gimmick = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"));

if (can_gimmick and _gimmick) {
	if (BeNoisy()) {
		audio_play_sound(sfx_Dash,10,0);
	}
	
	if (!done_gimmick and distance_to_object(Enemy) < 225)
	{
		var _target = instance_nearest(x,y,Enemy);
	delta_x = _target.x - x;
	delta_y = _target.y - y+15;
	
	var _hypotenuse = sqrt(delta_x * delta_x + delta_y * delta_y);
	
	delta_x *= dash_speed / _hypotenuse;
	delta_y *= dash_speed / _hypotenuse;
	hsp = delta_x;
	vsp = delta_y;
	
	done_gimmick = true;
	can_gimmick = false
	
	forcefield = instance_create_layer(x, y, layer, o_Forcefield);
	}
	else if (distance_to_object(Enemy) > 225)
	{ 
		hsp = 35.5 * image_xscale;
	}
	done_gimmick = true;
	can_gimmick = false;
	
	forcefield = instance_create_layer(x, y, layer, o_Forcefield);
}

if (done_gimmick) {
	forcefield.x = x;
	forcefield.y = y;
}
else if (forcefield != noone) {
	instance_destroy(forcefield);
	forcefield = noone;
}