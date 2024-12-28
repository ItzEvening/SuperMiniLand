event_inherited();

hascontrol = true; 

// original position for respawn
original_x = x;
original_y = y;

// lives stuff
chances = 2;
show_chances = true;

// sprites
idle = Mini_Idle
fall = Mini_Jump_Fall
run = Mini_Run2

coins = 0;

// health stuff
reset_iframe = function() {
	time_source_start(iframe_timer);
	time_source_start(blink_timer);
	invincible = true;
	//hpgui.lifetoframe(hp);
}

expire_iframe = function() {
	invincible = false;
	visible = true;
}

blink_iframe = function() {
	visible = !visible;
}

invincible = false;
iframe_timer = time_source_create(time_source_game, 2, time_source_units_seconds, expire_iframe);
blink_timer = time_source_create(time_source_game, 0.2, time_source_units_seconds, blink_iframe, [], 8);

hp_default = 3;
hp = hp_default;

function change_life(_delta){
	hp += _delta;
	hpgui.lifetoframe(hp);
}

// create font stuff
var _lives_struct = {xDraw: 140, yDraw: 800, scale: 0.75};
livesFont = instance_create_layer(0, 0, "Instances", FontDrawer, _lives_struct);

var _coins_struct = {xDraw: 25, yDraw: 45, scale: 0.6, drawCoin: true};
coinsFont = instance_create_layer(0, 0, "Instances", FontDrawer, _coins_struct);

// create the lives icon
livesicon = instance_create_layer(0, 0, "Instances", LivesIcon);
livesicon.init(self);

//create HP GUI
hpgui = instance_create_layer(0, 0, "Instances", GUI_HP);

// create the rainbow gem gui
rainbow = instance_create_layer(0, 0, "Instances", RainbowGUI);

change_visibility = function()
{
	show_chances = !show_chances;
}

manage_animations = function(_midair)
{
	//Animation Stuffs
	if (_midair)
	{
	    sprite_index = fall;
	    image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
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

function handle_death()
{
	if (chances == 0)
	{
		SlideTransition(TRANS_MODE.GOTO, Game_Over);
	}
	else if (chances == 1)
	{
		timer = time_source_create(time_source_global, 0.75, time_source_units_seconds, change_visibility, [], -1);
		time_source_start(timer);
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
}

#region gimmick

done_gimmick = false;
can_gimmick = false;

enable_gimmick = function() {
	can_gimmick = true;
}

gimmick_timer = time_source_create(time_source_global, 0.1, time_source_units_seconds, enable_gimmick);

#endregion

#region jump

sustain_length = 0.25;
jump_resist = 0.3;
released_jump = true;
finish_jump = function() {
	released_jump = true;
}
jump_timer = time_source_create(time_source_global, sustain_length, time_source_units_seconds, finish_jump);
#endregion