// move will be overwritten by children objects
var _underwater = place_meeting(x,y,water_tiles);

calculate_speeds(_underwater);

manage_collisions();

left_barrier.y = y;
right_barrier.y = y;