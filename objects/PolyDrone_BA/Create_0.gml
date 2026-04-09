event_inherited();

obey_collisions = false;
obey_gravity = false;

spr_dead = DroneDead;
sfx_dead = sfx_Drone_Defeat;


t_follow = 6;
t_follow_max = 6;

flysp = 2;
flysp_x = 0;
flysp_y = 0;

custom_die = function() {
	SpringIslandBoss.drone_death_count++;
}