conf = CC4_Game.config[level];
color = conf[label];
trap = label != CC4_Game.answers[level];

drill_layer = layer_get_id("Drills");
spike_layer = layer_get_id("Spikes");

height = 32;
if (trap) {
	height = 28;
}

for (var i = 0; i < height; i++) {
	var _y = y + 32 * i;
	
	instance_create_layer(x, _y, drill_layer, CC4_DrillOnlyBox, {
		color: color,
		sound: sound
	});
	
	instance_create_layer(x + 32, _y, drill_layer, CC4_DrillOnlyBox, {
		color: color,
		sound: sound
	});
	
}

if (trap) {
	instance_create_layer(x, y + 32 * 29, spike_layer, Hazard_Spikes_Death);
	instance_create_layer(x + 32, y + 32 * 29, spike_layer, Hazard_Spikes_Death);
	instance_create_layer(x, y + 32 * 30, spike_layer, CC4_Block);
}