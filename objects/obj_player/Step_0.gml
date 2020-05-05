/// @description Input & Movement

var input = Vec2(0, 0);
input[Axis.X] = (input_check(InputAction.Right) ? 1 : 0) - (input_check(InputAction.Left) ? 1 : 0);
input[Axis.Y] = (input_check(InputAction.Down) ? 1 : 0) - (input_check(InputAction.Up) ? 1 : 0);

if (!VecZERO(input))
{
	velocity = vector_scale(vector_normalize(input), spd);
}
else
{
	velocity = Vec2(0, 0);
}

x += velocity[Axis.X];
y += velocity[Axis.Y];