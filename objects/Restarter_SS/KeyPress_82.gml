audio_stop_all();

var _random = random(10);
			
if (_random < 1) {
				
	audio_stop_all();
	room_goto(Test);
				
}
else {
	SlideTransition(TRANS_MODE.GOTO, Main_Menu_2);
}