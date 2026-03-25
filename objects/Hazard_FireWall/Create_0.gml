//I need to be able to speak
//What n
event_inherited()
obey_gravity = false;
obey_collisions = false;
consumed = false;
originalx = x;

firespeed = 14.6;
if (global.difficulty == 0) {
	firespeed = 14;
}

revert = function() {
	x = originalx;
}

global.lo.add(self, PLAYER_DEATH, revert);

colors = [make_color_rgb(221, 0, 0), make_color_rgb(255, 101, 0), make_color_rgb(255, 203, 0), make_color_rgb(255, 101, 0)];