event_inherited();

#region functions

// iframe functions
reset_iframe = function() {
	time_source_reset(iframe_timer);
	time_source_reset(blink_timer);
	
	time_source_start(iframe_timer);
	time_source_start(blink_timer);
	invincible = true;
}

expire_iframe = function() {
	invincible = false;
	visible = true;
}

blink_iframe = function() {
	visible = !visible;
}

change_visibility = function() {
	show_chances = !show_chances;
	livesicon.set_show_chances(show_chances);
}

// life functions
change_life = function(_delta) {
	if (hp == 0 and _delta < 0) {
		handle_death();
	}
	
	else {
		hp += _delta;
		hpgui.lifetoframe(hp);
	}
	
	if (_delta < 0) {
		reset_iframe();
	}
}

// animation function
manage_animations = function(_midair) {
	//Animation Stuffs
	if (_midair)
	{
	    sprite_index = fall;
	    image_speed = 0;
	if (sign(vsp) == sign(grv)) image_index = 1; else image_index = 0;
	}
	else
	{
		image_speed = 1;
		if (hsp == 0)
		{
			sprite_index = idle;
		}
		else
		{
			sprite_index = run;
		}
	}
	if (hsp != 0)
	{
		image_xscale = sign(hsp);
	}
}

// death function
handle_death = function() {
	if (chances == 0)
	{
		SlideTransition(TRANS_MODE.GOTO, Game_Over);
	}
	else if (chances == 1)
	{
		time_source_start(icon_blink_timer);
	}
	
	if (chances > 0) {
		chances--;
		
	}
	
	hp = hp_default;
	hpgui.lifetoframe(hp);
	//change_life(3);
	x = original_x;
	y = original_y;
	hsp = 0;
	vsp = 0;
	
	// handle gravity
	grv = original_g;
	image_yscale = sign(grv);
	
	reset_iframe();
}

// gimmick function
enable_gimmick = function() {
	can_gimmick = true;
}

// jump function
finish_jump = function() {
	released_jump = true;
}
#endregion

#region variables

hascontrol = true; 

// original position for respawn
original_x = x;
original_y = y;
original_g = grv;

// lives stuff
chances = 5;
show_chances = true;

// sprites
idle = Mini_Idle
fall = Mini_Jump_Fall
run = Mini_Run2

coins = 0;

invincible = false;
iframe_timer = time_source_create(time_source_game, 2, time_source_units_seconds, expire_iframe);
blink_timer = time_source_create(time_source_game, 0.2, time_source_units_seconds, blink_iframe, [], 8);
icon_blink_timer = time_source_create(time_source_global, 0.75, time_source_units_seconds, change_visibility, [], -1);

hp_default = 3;
hp = hp_default;

boost_default = 1;
boost = boost_default;

// create font stuff
var _lives_struct = {xDraw: 140, yDraw: 800, scale: 0.75};
livesFont = instance_create_layer(0, 0, "Instances", FontDrawer, _lives_struct);
livesText = "";

var _coins_struct = {xDraw: 72, yDraw: 45, scale: 0.6, drawCoin: true};
coinsFont = instance_create_layer(0, 0, "Instances", FontDrawer, _coins_struct);

// create the lives icon
livesicon = instance_create_layer(0, 0, "Instances", LivesIcon);
livesicon.init(object_index);

//create HP GUI
hpgui = instance_create_layer(0, 0, "Instances", GUI_HP);
hpgui.init(object_index);

// create the rainbow gem gui
rainbow = instance_create_layer(0, 0, "Instances", RainbowGUI);

// gimmick variables
done_gimmick = false;
can_gimmick = false;
gimmick_timer = time_source_create(time_source_global, 0.1, time_source_units_seconds, enable_gimmick);

// jumping variables
sustain_length = 0.25;
jump_resist = 0.3;
released_jump = true;
jump_timer = time_source_create(time_source_global, sustain_length, time_source_units_seconds, finish_jump);
#endregion