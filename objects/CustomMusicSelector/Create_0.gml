index = 0;

global.music.custom = true;
new_music = global.music;

y1 = 146;
y2 = 476;
y3 = 806;
x0 = 856;

c_m = make_color_rgb(224, 32, 128);
c_8 = make_color_rgb(200, 68, 156);
c_e = make_color_rgb(66, 66, 100);

update_position = function() {
	if (index == 0) {
		y = 160;
	}

	else if (index == 1) {
		y = 480;
	}

	else {
		y = 864;
	}
}

update_position();