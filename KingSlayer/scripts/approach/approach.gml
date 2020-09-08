/// @arg start
/// @arg end
/// @arg shift
function approach(argument0, argument1, argument2) {
	//This script moves a value towards another value by a certain amount, without exceeding the target value
	if (argument0 < argument1)
	{
		return min(argument0 + argument2, argument1);
	}
	else
	{
		return max(argument0 - argument2, argument1);
	}


}
