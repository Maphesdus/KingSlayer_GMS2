/// @arg rect
function view_clamp_rect(argument0) {
	var rect = argument0;

	if (!is_Rect(rect))
	{
		show_error("view_clamp_rect expects {Rect} argument0, got {"+typeof(rect)+"}.", true);
	}

	// Right
	if (view_right() > rect[Edge.Right])
	{
		view_set_right(rect[Edge.Right]);
	}

	// Bottom
	if (view_bottom() > rect[Edge.Bottom])
	{
		view_set_bottom(rect[Edge.Bottom]);
	}

	// Left
	if (view_left() < rect[Edge.Left])
	{
		view_set_left(rect[Edge.Left]);
	}

	// Top
	if (view_top() < rect[Edge.Top])
	{
		view_set_top(rect[Edge.Top]);
	}


}
