var enemy = instance_place(x, y, Enemy);

if (enemy != noone and enemy.killable and !enemy.dead) {
	enemy.die();
}