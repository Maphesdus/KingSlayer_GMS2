/// @arg vecStart
/// @arg vecEnd
/// @arg shift
function vector_approach(argument0, argument1, argument2) {
	var v1 = argument0, v2 = argument1, shift = argument2;

	if (!is_array(v1))
	{
		show_error("vector_approach expects {Vector} argument0, got {"+typeof(v1)+"}.", true);
	}

	if (!is_array(v2))
	{
		show_error("vector_approach expects {Vector} argument1, got {"+typeof(v2)+"}.", true);
	}

	if (!is_real(shift))
	{
		show_error("vector_approach expects {real} argument2, got {"+typeof(shift)+"}.", true);
	}

	if (!vector_match_size(v1, v2))
	{
		show_error("vector_approach vectors must be the same size.", true);
	}

	var dimension = array_length_1d(v1);
	for(var i = 0; i < dimension; i++)
	{
		v1[i] = approach(v1[i], v2[i], shift);
	}
	return v1;


}
