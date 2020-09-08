/// @arg str
/// @arg index
function string_advance(argument0, argument1) {

	// This script will advance to the next character, skipping substrings enclosed in square brackets []
	var str = argument0, ind = argument1;

	var strlen = string_length(str);

	if (ind + 1 > strlen) return strlen;
	var nextchar = string_char_at(str, ind + 1);

	if (nextchar == "[")
	{
		while(ind <= strlen && string_char_at(str, ind) != "]")
		{
			ind++;
		}
		ind++;
	
		if (ind > strlen) return strlen;
		return ind;
	}
	else return ind + 1;


}
