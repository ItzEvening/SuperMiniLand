if (active) {
Player.image_yscale *= -1;
Player.grv *= -1;
active = false;
time_source_start(cooldown_timer)
}
