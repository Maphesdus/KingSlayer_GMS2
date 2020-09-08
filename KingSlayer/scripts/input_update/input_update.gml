function input_update() {
	// can_move is a flag that is controls whether movement actions should always be InputState.none or be interpreted from the keyboard
	var can_move = true;

	// If in dialogue, ignore movement input
	with(obj_dialogue_handler)
	{
		if (indialogue)
		{
			can_move = false;
			break;
		}
	}

	// If can't move, set all actions to InputState.none
	if (!can_move)
	{
		input_clear();
		return;
	}

	// For each action
	for(var i = 0; i < InputAction.sizeof; i++)
	{
		// Get its current state
		var current_state = inputStates[i];
	
		// prev_held is whether it was pressed or held last frame
		var prev_held = (current_state == InputState.pressed || current_state == InputState.held);
	
		// held is whether it is pressed or held this frame
		var held = false;
	
		var mapping = inputMapKeyboard[i];
		var key_count = array_length_1d(mapping);
	
		// For each key in this action's keyboard mapping
		for(var k = 0; k < key_count; k++)
		{
			// Test if it is pressed or held. If so, set held to true
			if (keyboard_check(mapping[k]))
			{
				held = true;
				break;
			}
		}
	
		// If held now but wasn't last frame, set to pressed
		if (held && !prev_held)
		{
			inputStates[i] = InputState.pressed;
		}
		// Else, if not held now but was last frame, set to released
		else if (!held && prev_held)
		{
			inputStates[i] = InputState.released;
		}
		// Else, if held now and last frame, set to held
		else if (held && prev_held)
		{
			inputStates[i] = InputState.held;
		}
		// Else, set to none (neither held now or last frame)
		else
		{
			inputStates[i] = InputState.none;
		}
	}


}
