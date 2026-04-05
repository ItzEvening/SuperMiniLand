event_inherited();

enum QARSTATE {
	STILL,
	JUMPING
}

jump = function() {
	if (dead) {
		return;
	}
	
	x = x_center;
	current_state = QARSTATE.JUMPING;
	jump_direction = sign(Player.x - x);
	sprite_index = QarFly;
	image_speed = 1;
	image_xscale = -1 * jump_direction;
	just_jumped = true;
	time_source_start(jump_commit_timer);
}

jump_commit = function() {
	if (current_state != QARSTATE.JUMPING or dead) {
		return;
	}
	
	if (just_jumped) {
		just_jumped = false;
	}
	
	var angle = jump_angle + random(jump_angle_sector);
	
	hsp = jump_distance * cos(angle) * jump_direction;
	vsp = sign(grv) * jump_distance * sin(angle);
	
	if (jump_angle < jump_angle_min) {
		jump_angle += jump_angle_decay;
	}
	
	time_source_start(jump_commit_timer);
}

jump_finish = function() {
	current_state = QARSTATE.STILL;
	sprite_index = QarIdle;
	jump_angle = jump_angle_max;
	x_center = x;
	x_rad = x_rad_min;
}

current_state = QARSTATE.STILL;

sfx_dead = EnemyDefeat2;
spr_dead = QarDead;
obey_gravity = false;
inertial = false;

x_center = x;
y_center = y;

x_rad_max = 96;
x_rad_min = 8;
x_rad = x_rad_min;
x_rad_growth = 2;


jump_angle_max = -2 * pi / 5;
jump_angle_min = pi / 6;
jump_angle = jump_angle_max;
jump_angle_decay = pi / 12;
jump_angle_sector = 7 * pi / 20;
jump_distance = 64;
jump_direction = 1;

jump_resolution = 10;

detect_distance = 500;

just_jumped = false;

anim_frame = 0;

jump_timer = time_source_create(time_source_game, 2, time_source_units_seconds, jump);
jump_commit_timer = time_source_create(time_source_game, 0.4, time_source_units_seconds, jump_commit);