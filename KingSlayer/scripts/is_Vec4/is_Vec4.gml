/// @arg {array} val
function is_Vec4(argument0) {
	var val = argument0;
	return (is_array(val) && array_length_1d(val) == 4);


}