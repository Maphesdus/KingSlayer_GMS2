/// @arg y
function view_set_bottom(argument0) {
	var yy = argument0;

	if (!is_real(yy))
	{
		show_error("view_set_bottom expects {real} argument0, got {"+typeof(yy)+"}.", true);
	}

	camera_set_view_pos_subpixel(view_camera[0], view_left(), yy - view_height());


}