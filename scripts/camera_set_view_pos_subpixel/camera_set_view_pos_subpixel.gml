///@description camera_set_view_pos_subpixel
///@param camera
///@param x
///@param y

var _cam = argument0,
		_x = argument1,
		_y = argument2,
		_sw = surface_get_width(application_surface),
		_vw = camera_get_view_width(_cam),
		_ratio = _vw/_sw;

_x = round(_x/_ratio)*_ratio;
_y = round(_y/_ratio)*_ratio;

camera_set_view_pos(_cam,_x,_y);