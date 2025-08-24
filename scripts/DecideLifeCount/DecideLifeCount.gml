/// @func DecideLifeCount()
/// @desc Determines life count based on current room
/// @return {Real} Amount of lives player should have
function DecideLifeCount(){
	if (IsCanvasChallenge()) {
		return 0;
	}

	// return default
	return 5;
}