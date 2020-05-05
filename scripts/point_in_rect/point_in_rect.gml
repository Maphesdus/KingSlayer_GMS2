/// @arg point
/// @arg rect
var point = argument0, rect = argument1;

if (!is_Point(point))
{
	show_error("point_in_rect expects {Point} argument0, got {"+typeof(point)+"}.", true);
}

if (!is_Rect(rect))
{
	show_error("point_in_rect expects {Rect} argument0, got {"+typeof(rect)+"}.", true);
}

return point_in_rectangle(point[Axis.X], point[Axis.Y], rect[Edge.Left], rect[Edge.Top], rect[Edge.Right], rect[Edge.Bottom]);