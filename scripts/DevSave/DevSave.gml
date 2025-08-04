// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DevSave(){
	
	CheckSaveBinding("version", "0.4");
	
	CheckSaveBinding("tutorial", true);
	
	CheckSaveBinding("spring", [true, true, true, true, true]);
	CheckSaveBinding("salmon", [true, true, true, true, true]);
	CheckSaveBinding("marble", [false, false, false, false, false, false]);
	CheckSaveBinding("midnight", [false, false, false, false, false, false]);
	CheckSaveBinding("secret", [false, false, false, false, false, false, false, false]);
	
	CheckSaveBinding("boss unlocked", false);
	CheckSaveBinding("bears unlocked", false);
	
	CheckSaveBinding("boss beaten", false);
	CheckSaveBinding("sanctuary accessed", false);
	
	CheckSaveBinding("all gems", false);
}