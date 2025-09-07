/// @func DecideLifeCount()
/// @desc Determines life count based on current room
/// @return {Real} Amount of lives player should have
function DecideLifeCount(){
	
	if (room == CanvasChallenge_5) {
		return 0;
	}

	// return default
	return 5;
}