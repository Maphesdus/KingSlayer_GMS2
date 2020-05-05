globalvar inputMapKeyboard, inputStates;

inputMapKeyboard = input_map_create_keyboard();
inputStates = [];
input_clear();

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