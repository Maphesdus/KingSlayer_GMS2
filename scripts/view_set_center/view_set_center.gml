/// @arg point
var point = argument0;

if (!is_Point(point))
{
	show_error("view_set_center expects {Point} argument0, got {"+typeof(point)+"}.", true);
}

camera_set_view_pos(view_camera[0], point[Axis.X] - view_width() / 2, point[Axis.Y] - view_height() / 2);