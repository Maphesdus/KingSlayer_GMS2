globalvar inputMapKeyboard, inputStates;

// Create a keyboard mapping of keys to actions
inputMapKeyboard = input_map_create_keyboard();

// Create an array of states, where each action gets a single state
inputStates = [];

// Set the states to all be InputState.none
input_clear();

// Helper enums
enum InputAction
{
	Right,
	Up,
	Left,
	Down,
	sizeof
}

enum InputState
{
	none,
	pressed,
	held,
	released,
	sizeof
}