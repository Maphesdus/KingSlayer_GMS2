function input_map_create_keyboard() {
	var map = [];

	for(var i = InputAction.sizeof - 1; i >= 0; i--)
	{
		map[i] = [];
	}

	// DEFAULT KEYBOARD INPUT MAPPING

	// Movement

	// These are keyboard mappings. Accepted default keys are in the implicit array data right of the = sign
	map[InputAction.Right] =	[ord("D"), vk_right];
	map[InputAction.Up] =		[ord("W"), vk_up];
	map[InputAction.Left] =		[ord("A"), vk_left];
	map[InputAction.Down] =		[ord("S"), vk_down];

	return map;


}
