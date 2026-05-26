index = 0;
num = 2;
selections = [noone, noone];
back_selected = false;
controllable = true;
selector_y_offset = 288;

t = 0;
t_max = 1.5;
selected = false;

scry = function() {
	for (var i = 0; i < num; i++) {
		var selection = instance_find(CharacterSelection, i);
		var sel_index = selection.index;
		selections[sel_index] = selection;
	}
}

scry();