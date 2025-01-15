event_inherited();
obey_collisions = false;
obey_gravity = false;

spr_dead = DroneDead;
sfx_dead = sfx_Drone_Defeat;

p_speed = 4;
x_prev = x;
path_start(Path1, p_speed, path_action_reverse, false);