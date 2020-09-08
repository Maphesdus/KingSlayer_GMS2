/// @description 

// What button was the mouse over last frame?
hover = MMButton.none;

// What button did the mouse left-click on? Persists until left-click is released
clicked = MMButton.none;

// If not active, buttons cannot be interacted with (used when fading out the main menu)
active = true;

// Enum of buttons
enum MMButton
{
	none = -1,
	start,
	sizeof
}