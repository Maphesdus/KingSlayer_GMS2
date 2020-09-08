/// @arg action
function input_check_released(argument0) {
	var action = argument0;
	return (inputStates[action] == InputState.released);


}
