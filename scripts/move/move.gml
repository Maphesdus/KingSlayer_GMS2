/// @arg input
/// @arg collider
var input = argument0, collider = argument1;

if (!is_Vec2(input))
{
	show_error("move expects {Vec2} argument0, got {"+typeof(input)+"}.", true);
}

if (!is_real(collider))
{
	show_error("move expects {real} argument1, got {"+typeof(collider)+"}.", true);
}

// Fractional Velocity Handling
velocity = vector_add(velocity, fracvelocity);

fracvelocity[Axis.X] = frac(velocity[Axis.X]);
fracvelocity[Axis.Y] = frac(velocity[Axis.Y]);
velocity = vector_subtract(velocity, fracvelocity);


// Collision & Actual Movement Handling
if (!instance_place(x + velocity[Axis.X], y + velocity[Axis.Y], collider))
{
	x += velocity[Axis.X];
	y += velocity[Axis.Y];
}
else
{
	// Move as close as possible
	
	// Horizontal
	var hamt = abs(velocity[Axis.X]);
	var hsign = sign(velocity[Axis.X]);
	
	while(hamt > 0)
	{
		if (!instance_place(x + hsign, y, collider))
		{
			x += hsign;
			hamt--;
		}
		else
		{
			hamt = 0;
			velocity[Axis.X] = 0;
		}
	}
	
	// Vertical
	var vamt = abs(velocity[Axis.Y]);
	var vsign = sign(velocity[Axis.Y]);
	
	while(vamt > 0)
	{
		if (!instance_place(x, y + vsign, collider))
		{
			y += vsign;
			vamt--;
		}
		else
		{
			vamt = 0;
			velocity[Axis.Y] = 0;
		}
	}
	
	// Angle Sweeping
	/*var len = vector_length(velocity);
	var dir = point_direction(0, 0, velocity[Axis.X], velocity[Axis.Y]);
	for(var angle = 10; angle <= 60; angle += 10)
	{
		for(var i = -1; i <= 1; i += 2)
		{
			var dirto = dir + angle * i;
			var lento = len;
			var xto = round(x + lengthdir_x(lento, dirto));
			var yto = round(y + lengthdir_y(lento, dirto));
			
			if (!instance_place(xto, yto, collider))
			{
				x = xto;
				y = yto;
				return;
			}
		}
	}*/
}