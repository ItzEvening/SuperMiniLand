// Find lives font instance
//for (var i = 0; i < instance_number(FontDrawer); i++)
//{
//	var _font_instance = instance_find(FontDrawer, i);
//	if (_font_instance.textName == "lives") 
//	{
//		livesText = _font_instance;
//		livesText.text = NumberFormatter(chances);
//	}
//}

livesFont.text = NumberFormatter(chances);


draw_sprite(CoinGUI, 0, 0, 0);


draw_set_font(TestFont);
draw_text(0, 750, string(coins));