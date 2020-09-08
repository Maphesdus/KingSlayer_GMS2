/// @arg val1
/// @arg val2
/// @arg amount
function coserp(argument0, argument1, argument2) {
	var y1 = argument0, y2 = argument1, mu = argument2;
	return lerp(y1,y2,(1-cos(mu*pi))/2);


}
