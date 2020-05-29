/// @description Input, Movement, & Animation

// input is a 2D vector representing keyboard input movement direction
var input = Vec2(0, 0);
input[Axis.X] = (input_check(InputAction.Right) ? 1 : 0) - (input_check(InputAction.Left) ? 1 : 0);
input[Axis.Y] = (input_check(InputAction.Down) ? 1 : 0) - (input_check(InputAction.Up) ? 1 : 0);

// process_input will alter velocity based on input and acceleration/friction
process_input(input);

// Increment delta accumulation by the system delta time
delta_accumulation += system.delta;

// If delta timing flag is not set, assume delta accumulation is exactly 1 every step
if (!delta_timing) delta_accumulation = 1;

// For each integer value of delta accumulation, run the physics simulation
while(delta_accumulation >= 1)
{
	// Physics
	move(input, par_collision);
	
	// Decrement delta accumulation
	delta_accumulation -= 1;
}

// Animation
if (!attacking)
{
	// If the player is not attacking
	if (!VecZERO(input))
	{
		// And is inputting a movement direction
		if (animation != "walk")
		{
			// Set the animation to "walk" if it isn't already
			image_index = 0;
			animation = "walk";
		}
	}
	else
	{
		// Else (the player is not inputting a movement direction)
		if (animation != "idle")
		{
			// Set the animation to "idle" if it isn't already
			image_index = 0;
			animation = "idle";
		}
	}
}
else
{
	// Else (the player is attacking) TODO
}