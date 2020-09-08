/// @arg point1
/// @arg point2
/// @arg amt
function point_lerp(argument0, argument1, argument2) {

	var point1 = argument0, point2 = argument1, amt = argument2;

	if (!is_Point(point1))
	{
		show_error("point_lerp expects {Point} argument0, got {"+typeof(point1)+"}.", true);
	}

	if (!is_Point(point2))
	{
		show_error("point_lerp expects {Point} argument1, got {"+typeof(point2)+"}.", true);
	}

	if (!is_real(amt))
	{
		show_error("point_lerp expects {real} argument2, got {"+typeof(amt)+"}.", true);
	}

	return Point(lerp(point1[Axis.X], point2[Axis.X], amt), lerp(point1[Axis.Y], point2[Axis.Y], amt));


}
