/// @description 
var ww = window_get_width(), wh = window_get_height();
if (ww != window_width || wh != window_height)
{
	display_set_gui_size(ww, wh);
	window_width = ww;
	window_height = wh;
}