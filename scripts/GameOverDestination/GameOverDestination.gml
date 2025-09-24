/// @func GameOverDestination()
/// @desc Determines room to go to after getting a game over
/// @return {Asset.GMRoom} Room destination
function GameOverDestination(){
	if (IsCanvasChallenge()) {
		return ChallengeFailed_Room;
	}
	
	return Game_Over;
}