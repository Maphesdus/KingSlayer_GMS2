/// @arg a
/// @arg b
var a = argument0, b = argument1;
if (typeof(a) != typeof(b))
{
	return false;
}

switch(typeof(a))
{
	default:
		return (a == b);
		break;
	case "array":
		return array_equals(a, b);
		break;
}