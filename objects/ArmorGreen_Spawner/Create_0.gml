spawn = function() {
	var lb = bbox_left + 32;
	var rb = bbox_right - 32;
	var spawnx = clamp(Player.x, lb, rb);
	armor = instance_create_layer(spawnx, y, layer, ArmorGreen, {
		left_border : lb,
		right_border: rb
	});
	armor.spawner = self;
	summoned = true;
	t = 0;
}

summoned = false;
spawn();

t = 0;
t_max = 7;