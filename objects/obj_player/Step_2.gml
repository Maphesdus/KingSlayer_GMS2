/// @description View

// to is the 2D point to move the center of the view towards
var to = Point(x, y);

// This chunk of code makes the view stop gracefully at the edge of the room, instead of abruptly
// It moves the view center to "to", clamps it to the room, and uses that new center to overwrite "to"

// vcenter is the 2D point at the center of the view
vcenter = view_center();

// Set the view center to "to", the destination point
view_set_center(to);

// Clamp the view to the room size
view_clamp_rect(Rect(0, 0, room_width, room_height));

// Overwrite "to" to be the new view center
to = view_center();

// Set the view back to its actual center
view_set_center(vcenter);





// Move the view center 10% of the distance towards "to"
view_set_center(point_lerp(view_center(), to, 0.1));