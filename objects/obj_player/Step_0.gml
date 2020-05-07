/// @description Input, Movement, & Animation

var input = Vec2(0, 0);
input[Axis.X] = (input_check(InputAction.Right) ? 1 : 0) - (input_check(InputAction.Left) ? 1 : 0);
input[Axis.Y] = (input_check(InputAction.Down) ? 1 : 0) - (input_check(InputAction.Up) ? 1 : 0);

process_input(input);

delta_accumulation += system.delta;
if (!delta_timing) delta_accumulation = 1;
while(delta_accumulation >= 1)
{
	move(input, par_collision);
	delta_accumulation -= 1;
}

// Animation
if (!attacking)
{
	if (!VecZERO(input))
	{
		if (animation != "walk")
		{
			image_index = 0;
			animation = "walk";
		}
	}
	else
	{
		if (animation != "idle")
		{
			image_index = 0;
			animation = "idle";
		}
	}
}
else
{
	
}