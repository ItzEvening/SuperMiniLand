// You can write your code in this editor
event_inherited();

//// physics properties
walksp = 3.5;
walkstr = 0.03
air_resistance = 0.1;
frict = 0.3;

// sprites
idle = A_Allie_Idle
fall = A_Allie_Jump_Fall
run = A_Allie_Run

// small
hp_default = 2;
hp = hp_default;

// forcefield
forcefield = noone;

// create font stuff
var _score_struct = {xDraw: 1180, yDraw: 25, scale: 0.5, align_right: true};
scoreFont = instance_create_layer(0, 0, "Instances", FontDrawer, _score_struct);

instance_destroy(coinsFont);