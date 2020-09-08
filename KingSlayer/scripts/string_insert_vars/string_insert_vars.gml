/// @arg str
function string_insert_vars(argument0) {

	// This script will convert a string like "x: {x}" to "x: " + string(x)

	var sourcestr = argument0;
	var strlen = string_length(sourcestr) - 1;
	if (strlen <= -1) return sourcestr;

	var str = string_chars(sourcestr);
	var newstr = "";

	var start = 0;
	var current = 0;

	while(true)
	{
		if (current > strlen) break;
	
		if (str[current] == "{")
		{
			current++;
			if (current > strlen) break;
		
			start = current;
			while(str[current] != "}")
			{
				current++;
				if (current > strlen) break;
			}
		
			var variablename = string_copy(sourcestr, start+1, current - start);
		
			newstr += "|" + variablename + "|";
			current++;
		}
		else newstr += str[current++];
	}

	return newstr;


}
