randomize();
rand = random(3);

if (rand > 1)
{
	sprite_index = MainMenu_Logo2;
	MusicPlayer.play_music(MainMusic);
}
//else if (rand < 2)
//{
	//sprite_index = Sprite43;
	//MusicPlayer.play_music(Title3);
//}
// Can you perhaps fix it pretty please?
else
{
	MusicPlayer.play_music(Touhou);
}