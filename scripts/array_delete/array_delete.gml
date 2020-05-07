/// @arg array
/// @arg index
var a = argument0, ind = argument1;

var result = [];
var asize = array_length_1d(a);
for(var i = 0; i < ind; i++)
{
	result[i] = a[i];
}
for(var i = ind; i < asize-1; i++)
{
	result[i] = a[i + 1];
}
return result;