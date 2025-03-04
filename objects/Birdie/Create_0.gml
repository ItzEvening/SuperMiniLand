event_inherited();
obey_collisions = false;
obey_gravity = false;

spr_dead = Birdie_Dead;
sfx_dead = EnemyDefeat;

p_speed = 2;
x_prev = x;
path_start(Path1, p_speed, path_action_reverse, false);