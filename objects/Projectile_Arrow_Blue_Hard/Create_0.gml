event_inherited();
trajectory_direction = pi;
trajectory_speed = 4;

frame = 0;
frame_max = 2;

max_angle_delta = pi / 60;
time_source_reconfigure(expire_timer, 3, time_source_units_seconds, expire);
time_source_start(expire_timer);