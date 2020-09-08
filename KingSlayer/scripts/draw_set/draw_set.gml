/// @param {real} color
/// @param {real} alpha
/// @param {real} font
/// @param {real} halign
/// @param {real} valign
function draw_set() {

	if (argument_count > 0) draw_set_color (argument[0]);
	if (argument_count > 1) draw_set_alpha (argument[1]);
	if (argument_count > 2) draw_set_font  (argument[2]);
	if (argument_count > 3) draw_set_halign(argument[3]);
	if (argument_count > 4) draw_set_valign(argument[4]);


}
