var dx = Player.x - x;
var dy = Player.y - y;
var xwarning = Camera.guiX(x + 32);
var ywarning = Camera.guiY(y + 32);

var xinrange = (xwarning > 0) and (xwarning < view_wport[0]);
var yinrange = (ywarning > 0) and (ywarning < view_hport[0]);


var yabove = ywarning < 0;
var ybelow = ywarning > view_hport[0];

var xperipheral = !yabove and !ybelow and !xinrange and abs(dx) < 400;
var yperipheral = yabove and dy < 600 and xinrange;

if (yperipheral) {
	ywarning = 0;
}

if (yperipheral or xperipheral) {
	xwarning = clamp(xwarning, 32, view_wport[0] - 32);
	draw_sprite(RockAlert, -1, xwarning, ywarning);
}