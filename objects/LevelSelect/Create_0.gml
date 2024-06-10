function rectangle_type()
{
	var _rect_temp = subselection_list[subselection];
	if (current_type != _rect_temp.recttype)
	{
		switch (_rect_temp.recttype)
		{
			case "num":
				width = 38;
				height = 63;
				current_type = "num";
				break;
				
			case "text":
				width = 580;
				height = 90;
				current_type = "text";
				break;
			
			case "special":
				width = 275;
				height = 80;
				current_type = "special";
				break;
		}
	}
}


json_selections = JSONHelper("level_select.json");
subselection_list = json_selections.subselections;
selection_list = json_selections.selections;

selection = 0;
subselection = 0;

selection_maximum = 9;
minima = [0, 3, 6, 9, 12, 15, 18, 21, 24, 29];
maxima = [2, 5, 8, 11, 14, 17, 20, 23, 28, 29];


rectangle_map = ds_map_create();
rectangle_map[? "num"] = {width: 38, height: 63};
rectangle_map[? "text"] = {width: 580, height: 90};
rectangle_map[? "special"] = {width: 275, height: 80};