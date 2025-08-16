// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DevSave(){
	
	CheckSaveBinding(SV_VERSION, "0.4");
	
	CheckSaveBinding(SV_TUTORIAL, false);
	
	CheckSaveBinding(SV_GEM_SPRING, [false, false, false, false, false]);
	CheckSaveBinding(SV_GEM_SALMON, [false, false, false, false, false]);
	CheckSaveBinding(SV_GEM_MARBLE, [false, false, false, false, false, false]);
	CheckSaveBinding(SV_GEM_MIDNIGHT, [false, false, false, false, false, false]);
	CheckSaveBinding(SV_GEM_SECRET, [false, false, false, false, false, false, false, false]);
	
	CheckSaveBinding(SV_BOSS_UNLOCKED, false);
	CheckSaveBinding(SV_BEARS_UNLOCKED, false);
	
	CheckSaveBinding(SV_BOSS_BEATEN, false);
	CheckSaveBinding(SV_MAR_MID_UNLOCKED, true);
	CheckSaveBinding(SV_SANCT_FOUND, false);
	
	CheckSaveBinding(SV_ALL_GEMS, false);
}