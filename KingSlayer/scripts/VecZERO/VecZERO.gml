/// @arg vector
function VecZERO(argument0) {
	var v = argument0;

	if (!is_array(v))
	{
		show_error("VecZERO expects {Vector} argument0, got {"+typeof(v)+"}.", true);
	}

	var dimension = array_length_1d(v);
	for(var i = 0; i < dimension; i++)
	{
		if (v[i] != 0)
		{
			return false;
		}
	}
	return true;


}
