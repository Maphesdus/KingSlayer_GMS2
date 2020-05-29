/// @arg input
var input = argument0;

// input must be a 2D vector
if (!is_Vec2(input))
{
	show_error("move expects {Vec2} argument0, got {"+typeof(input)+"}.", true);
}

// Input Handling
if (!VecZERO(input))
{
	// If input is non-zero, normalize it
	input = vector_normalize(input);
	
	// Shift velocity towards input * spd with a shift size of acceleration
	velocity = vector_approach(velocity, vector_scale(input, spd), accel);
	
	// Set the player's facing direction based on the input direction, rounded to 4 directions
	facingDir = round(360 + point_direction(0, 0, input[Axis.X], input[Axis.Y])/90) % 4;
}
else
{
	// If input is 0, shift velocity towards 0 with a shift size of friction
	velocity = vector_approach(velocity, Vec2(0, 0), fric);
	
	// If velocity is 0, set the fractional velocity to 0
	if (VecZERO(velocity)) fracvelocity = Vec2(0, 0);
}