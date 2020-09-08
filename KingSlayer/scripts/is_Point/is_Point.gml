/// @arg {array} val
function is_Point(argument0) {
	var val = argument0;
	return (is_array(val) && array_length_1d(val) == 2);


}
