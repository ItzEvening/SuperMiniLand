player = noone;

if (instance_exists(Evie)) {
	player = instance_find(Evie, 0);
}
else if (instance_exists(Mini)) {
	player = instance_find(Mini, 0);
}