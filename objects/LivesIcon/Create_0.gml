player = noone;
sprite = MiniLivesIcon;

if (instance_exists(Evie)) {
	player = instance_find(Evie, 0);
	sprite = EvieLivesIcon;
}
else if (instance_exists(Mini)) {
	player = instance_find(Mini, 0);
}