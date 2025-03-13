var _player_y_range = Player.y < y + 32 and Player.y > y - 64;

if (distance_to_object(Player) < 64) {
	if (go_attack) {
		image_xscale = sign(x - Player.x);
		
		
		sprite_index = ArmorGrayAttack;
		attacking = true;
		time_source_start(expire_timer);
	}
	else if (!attacking) {
		sprite_index = ArmorGrayIdle;
		image_index = 2;
	}
	
}
else if (distance_to_object(Player) < 200 and _player_y_range) {
	sprite_index = ArmorGrayIdle;
	image_index = 1;
}
else if (!attacking) {
	sprite_index = ArmorGrayIdle;
	image_index = 0;
}