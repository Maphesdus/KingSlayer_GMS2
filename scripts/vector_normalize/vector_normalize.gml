/// @arg vector
var v = argument0;

if (!is_array(v))
{
	show_error("vector_normalize expects {Vector} argument0, got {"+typeof(v)+"}.", true);
}

var length = vector_length(v);

var dimension = array_length_1d(v);
for(var i = 0; i < dimension; i++)
{
	v[i] /= length;
}
return v;