current = false;

update_checkpoints = function() {
	
	for (var i = 0; i < instance_number(o_Checkpoint); ++i) {
	
		var _instance = instance_find(o_Checkpoint, i);
	
		if (_instance.id != id){
			_instance.sprite_index = Checkpoint_Idle;
			_instance.current = false;
		}
		else {
			_instance.sprite_index = Checkpoint;
		}
	}
	
}