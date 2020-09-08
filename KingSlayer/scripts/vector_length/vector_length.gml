/// @arg vector
function vector_length(argument0) {
	var v = argument0;

	if (!is_array(v))
	{
		show_error("vector_length expects {Vector} argument0, got {"+typeof(v)+"}.", true);
	}

	var total = 0;

	var dimension = array_length_1d(v);
	for(var i = 0; i < dimension; i++)
	{
		total += sqr(v[i]);
	}
	return sqrt(total);


}
