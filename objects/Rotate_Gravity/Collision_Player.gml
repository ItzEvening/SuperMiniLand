if (active) {
audio_play_sound(sfx_Gravity,1,0);
Player.image_yscale *= -1;
Player.grv *= -1;
active = false;
time_source_start(cooldown_timer)
}
