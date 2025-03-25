event_inherited();

#region functions

// iframe functions
reset_iframe = method(self, s_iframe_reset);
expire_iframe = method(self, s_iframe_expire);
blink_iframe = method(self, s_iframe_blink);
change_visibility = method(self, s_change_visibility);

// life functions
change_life = method(self, s_change_life);

// animation function
manage_animations = method(self, s_manage_animations);

// death function
handle_death = method(self, s_handle_death);

// gimmick function
enable_gimmick = method(self, s_enable_gimmick);

// jump function
finish_jump = method(self, s_finish_jump);
#endregion

#region variables

hascontrol = true; 

// original position for respawn
original_x = x;
original_y = y;

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

hp_default = 3;
hp = hp_default;

boost_default = 1;
boost = boost_default;

// create font stuff
var _lives_struct = {xDraw: 140, yDraw: 800, scale: 0.75};
livesFont = instance_create_layer(0, 0, "Instances", FontDrawer, _lives_struct);

var _coins_struct = {xDraw: 72, yDraw: 45, scale: 0.6, drawCoin: true};
coinsFont = instance_create_layer(0, 0, "Instances", FontDrawer, _coins_struct);

// create the lives icon
livesicon = instance_create_layer(0, 0, "Instances", LivesIcon);
livesicon.init(self);

//create HP GUI
hpgui = instance_create_layer(0, 0, "Instances", GUI_HP);

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