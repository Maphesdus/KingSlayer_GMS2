/// @description View

to = Point(x, y);

// This chunk of code makes the view stop gracefully at the edge of the room, instead of abruptly
vcenter = view_center();
view_set_center(to);
view_clamp_rect(Rect(0, 0, room_width, room_height));
to = view_center();
view_set_center(vcenter);

view_set_center(point_lerp(view_center(), to, 0.1));