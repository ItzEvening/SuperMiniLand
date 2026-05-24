event_inherited();

hard_exclusive();

spawner = noone;
spr_dead = SandWorm_Dead;
emerged = false;
hostile = true;
sprite_index = SandWorm_Spawn;

custom_die = function() {
	if (spawner != noone) {
		spawner.hasworm = false;
	}
}