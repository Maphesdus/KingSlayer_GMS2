for(var i = InputAction.sizeof - 1; i >= 0; i--)
{
	// Loop through all actions and set their state to InputState.none
	inputStates[i] = InputState.none;
}