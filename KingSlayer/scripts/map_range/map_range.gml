/// @arg value
/// @arg min1
/// @arg max1
/// @arg min2
/// @arg max2
function map_range(argument0, argument1, argument2, argument3, argument4) {

	var value = argument0;
	var min1 = argument1;
	var max1 = argument2;
	var min2 = argument3;
	var max2 = argument4;

	return min2 + (max2 - min2) * ((value-min1)/(max1-min1));


}
