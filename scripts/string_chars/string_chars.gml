/// @arg str

// This script will take a string and return an array of chars

var str = argument0;
var chars = [];

var strlen = string_length(str);

for(var i = 1; i <= strlen; i++)
{
	append(chars, string_char_at(str, i));
}

return chars;