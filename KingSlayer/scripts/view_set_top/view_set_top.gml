/// @arg y
function view_set_top(argument0) {
	var yy = argument0;

	if (!is_real(yy))
	{
		show_error("view_set_top expects {real} argument0, got {"+typeof(yy)+"}.", true);
	}

	camera_set_view_pos_subpixel(view_camera[0], view_left(), yy);


}
