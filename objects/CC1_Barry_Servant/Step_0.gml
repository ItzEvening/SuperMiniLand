event_inherited();

if (!descending) {
	var _dist = abs(x - Picnic.x);

	if (_dist <= 50) {
		descending = true;
		path_end();
		vsp = 2;
	}
}

// to prevent them from floating
if (place_meeting(x, y, CC1_Barry) or place_meeting(x, y, CC1_Brisket)) {
	
	var _list = ds_list_create();
	var _num = instance_place_list(x, y, CC1_Barry, _list, false);
	_num += instance_place_list(x, y, CC1_Brisket, _list, false);
	
    for (var i = 0; i < _num; ++i)
    {
        var _inst = _list[| i];
		if (_inst.y > y) {
			y--;
			break;
		}
    }
	
	ds_list_destroy(_list);
}

if (y > room_height + 100) {
	instance_destroy();
}