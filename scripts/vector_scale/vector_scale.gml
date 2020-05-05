/// @arg vector
/// @arg scalar
var v = argument0, s = argument1;

if (!is_array(v))
{
	show_error("vector_scale expects {Vector} argument0, got {"+typeof(v)+"}.", true);
}

if (!is_real(s))
{
	show_error("vector_scale expects {real} argument1, got {"+typeof(s)+"}.", true);
}

var dimension = array_length_1d(v);
for(var i = 0; i < dimension; i++)
{
	v[i] *= s;
}
return v;