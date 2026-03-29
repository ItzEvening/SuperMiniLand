var enemy = instance_place(x, y, Enemy);

if (enemy != noone and enemy.killable) {
	enemy.die();
}