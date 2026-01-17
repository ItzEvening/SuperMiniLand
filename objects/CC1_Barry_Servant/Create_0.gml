event_inherited();
obey_gravity = false;
spr_dead = BarDead;
sfx_dead = EnemyDefeat2;
rot = false;
descending = false;
image_xscale *= -1 * sign(path_sp);

path_start(chosen_path, path_sp, path_action_continue, false);


// for king barry
thud = function() {
	if (!dead) {
		vsp = -1 * sign(grv) * 4;
	} else {
		die();
	}
}

global.lo.add(self, BIG_THUD, thud);