event_inherited();
obey_gravity = false;
spr_dead = BarDead;
sfx_dead = EnemyDefeat2;
rot = false;
descending = false;
image_xscale *= -1 * sign(path_sp);

path_start(chosen_path, path_sp, path_action_continue, false);