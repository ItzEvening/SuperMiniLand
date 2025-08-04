/// @func BeNoisy()
/// @desc Returns if player should make noises or not
/// @return {Bool} Whether player should be noisy
function BeNoisy(){
	return room != HintLevel;
}