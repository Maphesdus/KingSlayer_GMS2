/// @arg action
function input_check(argument0) {
	var action = argument0;
	return (inputStates[action] == InputState.pressed || inputStates[action] == InputState.held);


}
