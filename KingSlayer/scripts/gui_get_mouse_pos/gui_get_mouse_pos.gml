function gui_get_mouse_pos() {
	var mx = window_mouse_get_x();
	var my = window_mouse_get_y();

	mx = map_range(mx, 0, window_get_width(), 0, display_get_gui_width());
	my = map_range(my, 0, window_get_width(), 0, display_get_gui_width());
	return Point(mx, my);


}
