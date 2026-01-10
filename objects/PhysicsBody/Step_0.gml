// move will be overwritten by children objects

move = 0;
var _underwater = place_meeting(x,y,water_tiles);

calculate_speeds(move, _underwater);

manage_collisions();

left_barrier.y = y;
right_barrier.y = y;

recheck_grounded_solid();