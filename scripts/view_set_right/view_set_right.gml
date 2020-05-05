/// @arg x
var xx = argument0;

if (!is_real(xx))
{
	show_error("view_set_right expects {real} argument0, got {"+typeof(xx)+"}.", true);
}

camera_set_view_pos(view_camera[0], xx - view_width(), view_top());