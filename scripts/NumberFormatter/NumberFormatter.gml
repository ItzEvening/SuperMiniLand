function NumberFormatter(_num){
	if (_num < 10)
	{
		return "0" + string(_num);
	}
	
	return string(_num);
}