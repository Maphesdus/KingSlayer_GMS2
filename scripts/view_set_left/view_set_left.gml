/// @arg x
var xx = argument0;

if (!is_real(xx))
{
	show_error("view_set_left expects {real} argument0, got {"+typeof(xx)+"}.", true);
}

camera_set_view_pos_subpixel(view_camera[0], xx, view_top());