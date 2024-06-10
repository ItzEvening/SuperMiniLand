var invalidKeys = keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down);

if ((keyboard_check_pressed(vk_anykey) or mouse_check_button_pressed(mb_any)) and subselection == 29 and !invalidKeys)
{
	audio_play_sound(SoundTest, 10, false);
}