/// @func IsCanvasChallenge()
/// @desc Determines if current stage is a canvas challenge
/// @return {Bool} Whether current stage is a canvas challenge
function IsCanvasChallenge(){
	
	return room == CanvasChallenge_1 
	or room == CanvasChallenge_2
	or room == CanvasChallenge_3
	or room == CanvasChallenge_5;

}