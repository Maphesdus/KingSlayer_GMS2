/// @arg v1
/// @arg v2
var v1 = argument0, v2 = argument1;

if (!is_array(v1))
{
	show_error("vector_match_size expects {Vector} argument0, got {"+typeof(v1)+"}.", true);
}

if (!is_array(v2))
{
	show_error("vector_match_size expects {Vector} argument1, got {"+typeof(v2)+"}.", true);
}

return (array_length_1d(v1) == array_length_1d(v2));