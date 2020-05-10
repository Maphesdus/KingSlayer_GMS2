/// @arg value
/// @arg y
/// @arg height
var value = argument0, yy = argument1, height = argument2;
value = map_range(value, 0, 1, -1, 1);
yy /= height;							// 0 => 1

var dy = 1 - 4*abs(yy - 0.5);			// -1 => 1
dy = power(abs(dy), 1 / 3.5) * sign(dy);
var beta = abs(dy) * 0.75;				// 0.9 => 0 => 0.9 => 0 => 0.9

var temp = coserp(value, dy, beta);
if (temp < 0)
{
	draw_set_color(merge_color(c_blue, c_white, temp + 1));
}
else
{
	draw_set_color(merge_color(c_white, c_red, temp));
}
return map_range(temp, -1, 1, 0, 1);

#macro __lowtemp -25
#macro __hightemp 45