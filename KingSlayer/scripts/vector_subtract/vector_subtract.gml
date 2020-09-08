/// @arg v1
/// @arg v2
function vector_subtract(argument0, argument1) {
	var v1 = argument0, v2 = argument1;

	if (!is_array(v1))
	{
		show_error("vector_subtract expects {Vector} argument0, got {"+typeof(v1)+"}.", true);
	}

	if (!is_array(v2))
	{
		show_error("vector_subtract expects {Vector} argument1, got {"+typeof(v2)+"}.", true);
	}

	if (!vector_match_size(v1, v2))
	{
		show_error("vector_subtract vectors must be the same size.", true);
	}

	var dimension = array_length_1d(v1);
	for(var i = 0; i < dimension; i++)
	{
		v1[i] -= v2[i];
	}
	return v1;


}
