/// @arg input
var input = argument0;

if (!is_Vec2(input))
{
	show_error("move expects {Vec2} argument0, got {"+typeof(input)+"}.", true);
}

// Input Handling
if (!VecZERO(input))
{
	input = vector_normalize(input);
	velocity = vector_approach(velocity, vector_scale(input, spd), accel);
	facingDir = round(360 + point_direction(0, 0, input[Axis.X], input[Axis.Y])/90) % 4;
}
else
{
	velocity = vector_approach(velocity, Vec2(0, 0), fric);
	if (VecZERO(velocity)) fracvelocity = Vec2(0, 0);
}