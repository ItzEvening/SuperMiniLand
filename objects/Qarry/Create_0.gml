event_inherited();
hard_exclusive();

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
	
	jump_commit_t = 0;
}

jump_finish = function() {
	current_state = QARSTATE.STILL;	
	jump_angle = jump_angle_max;
	x_center = x;
	y_center = y;
	x_rad = x_rad_min;
	
	if (!dead) {
		sprite_index = QarIdle;
	}	
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


jump_angle_max = pi / -2;
jump_angle_min = pi / 6;
jump_angle = jump_angle_max;
jump_angle_decay = pi / 12;
jump_angle_sector = pi / 2;
jump_distance = 64;
jump_direction = 1;

idle_resolution = 20;
jump_resolution = 10;

detect_distance = 500;

just_jumped = false;

anim_frame = 0;

jump_timer = time_source_create(time_source_game, 2, time_source_units_seconds, jump);

jump_commit_t = 0;
jump_commit_t_max = 0.4;

// invert sprite in negative gravity
image_yscale = sign(grv);