/// @arg str
/// @arg open
/// @arg close
/// @arg current

// This script takes a string, an open string, and a close string, and finds the next occurence of that and returns the string between the open and close
// as well as the index of the character right after the close

// Example: "Hello [FF0000]World!", "[", "]", 1 finds the first match for "[...]" and returns "FF0000", the string between open and close
// This also works with multiple-char open and close strings, such as "{{", "}}"
// Closes that appear before opens are ignored. So, "Hello] [FF0000]World!" would ignore the first "]".

var str = argument0, open = argument1, close = argument2, current = argument3, final = max(0, current-1), first = current;
str = string_delete(str, 1, max(0, current - 1));	// This removes the string before current, so it doesn't find previous pairs

current = string_pos(open, str);
if (current == 0) return ["", first];				// No occurence of open exists after current
current += string_length(open)-1;
final += current;

str = string_delete(str, 1, current);				// Deletes the string up to and including open
current = string_pos(close, str);
if (current == 0) return ["", first];				// No occurence of close exists after the open
final += current + string_length(close);
return [string_copy(str, 1, current - 1), final];