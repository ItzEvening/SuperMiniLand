var _player_y_range = Player.y < y + 32 and Player.y > y - 64;

if (distance_to_object(Player) < 200 and _player_y_range) {
	if (go_attack) {
		sprite_index = Arty_Cannon_Attack;
		image_xscale = sign(x - Player.x);
		go_attack = false;
		attacking = true;
		time_source_start(expire_timer);
	}
	else if (!attacking) {
		sprite_index = Arty_Cannon_Idle;
		image_index = 1;
	}
}
else if (!attacking) {
	sprite_index = Arty_Cannon_Idle;
	image_index = 0;
}