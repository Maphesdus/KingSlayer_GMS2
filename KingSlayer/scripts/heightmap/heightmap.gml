/// @arg value
function heightmap(argument0) {
	var value = argument0;

	// Contras
	var contrast = 3.5;
	var brightness = 0.05;
	var diff = 0.35;
	value = map_range(2 * sigmoid(map_range(clamp(value - diff, 0, 1), 0, 1, -1, 1) * contrast, 10) - 1 + brightness, -1, 1, 0, 1);
	value = clamp(value, 0, 1);

	var maxval = map_range(2 * sigmoid(map_range(clamp(1 - diff, 0, 1), 0, 1, -1, 1) * contrast, 10) - 1 + brightness, -1, 1, 0, 1);
	maxval = clamp(maxval, 0, 1);

	value /= maxval;

#macro __sealevel 0.35
#macro __beachlevel 0.4
#macro __mountainlevel 0.85

	if (value <= __sealevel)
	{
		draw_set_color(merge_color(c_blue, c_aqua, sqr(value / __sealevel)));
	}
	else if (value <= __beachlevel)
	{
		draw_set_color(merge_color(c_yellow, merge_color(c_yellow, c_white, 0.5), map_range(value, __sealevel, __beachlevel, 0, 1)));
	}
	else if (value <= __mountainlevel)
	{
		draw_set_color(merge_color(c_green, c_lime, map_range(value, __beachlevel, __mountainlevel, 0, 1)));
	}
	else
	{
		var val = map_range(value, __mountainlevel, 1, 0, 1);
		draw_set_color(merge_color(c_dkgray, c_white, val * val));
	}
	return value;


}
