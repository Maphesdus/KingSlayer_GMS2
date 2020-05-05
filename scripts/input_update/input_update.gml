for(var i = 0; i < InputAction.sizeof; i++)
{
	var current_state = inputStates[i];
	
	var prev_held = (current_state == InputState.pressed || current_state == InputState.held);
	var held = false;
	
	var mapping = inputMapKeyboard[i];
	var key_count = array_length_1d(mapping);
	for(var k = 0; k < key_count; k++)
	{
		if (keyboard_check(mapping[k]))
		{
			held = true;
			break;
		}
	}
	
	if (held && !prev_held)
	{
		inputStates[i] = InputState.pressed;
	}
	else if (!held && prev_held)
	{
		inputStates[i] = InputState.released;
	}
	else if (held && prev_held)
	{
		inputStates[i] = InputState.held;
	}
	else
	{
		inputStates[i] = InputState.none;
	}
}