// Physics Stuffs
var _midair = !place_meeting(x,y+1,ground_tiles) and !place_meeting(x,y+1,rail_tiles);
move = 0;
var _underwater = place_meeting(x,y,water_tiles);

calculate_speeds(move, _midair, _underwater);

manage_collisions();

left_barrier.y = y;
right_barrier.y = y;