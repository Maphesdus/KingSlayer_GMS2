function view_center() {
	return Point(lerp(view_left(), view_right(), 0.5), lerp(view_top(), view_bottom(), 0.5));


}
