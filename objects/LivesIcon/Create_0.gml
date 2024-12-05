player = noone;
sprite = MiniLivesIcon;

if (instance_exists(Evie)) {
	player = instance_find(Evie, 0);
	sprite = EvieLivesIcon;
}
else if (instance_exists(Mini)) {
	player = instance_find(Mini, 0);
}

else if (instance_exists(Allie)) {
	player = instance_find(Allie, 0);
}

else if (instance_exists(Arcturus)) {
	player = instance_find(Arcturus, 0);
}