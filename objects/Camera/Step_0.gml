if (instance_exists(follow))
{
  xTo = follow.x;
  yTo = follow.y;
}

x += (xTo - x) / 15;
y += (yTo - y) / 15;

x = clamp(x,view_w_half+buff,room_width-view_w_half-buff);
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff);