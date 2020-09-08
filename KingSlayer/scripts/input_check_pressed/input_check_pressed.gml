/// @arg action
function input_check_pressed(argument0) {
	var action = argument0;
	return (inputStates[action] == InputState.pressed);


}
