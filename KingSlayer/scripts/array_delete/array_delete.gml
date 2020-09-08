/// @arg array
/// @arg index
function array_delete(argument0, argument1) {
	var a = argument0, ind = argument1;

	// This script returns a new array with the given index removed

	// result is the returned array
	var result = [];

	// asize (array size) is the size of the given array
	var asize = array_length_1d(a);
	for(var i = 0; i < ind; i++)
	{
		// Loop through the array from the beginning up until the index to be removed
		result[i] = a[i];
	}
	for(var i = ind; i < asize-1; i++)
	{
		// Loop through the array from the removed index until the end, with a copy offset of +1
		result[i] = a[i + 1];
	}
	// Return the altered array
	return result;


}
