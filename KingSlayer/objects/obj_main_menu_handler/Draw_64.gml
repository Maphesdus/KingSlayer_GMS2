/// @description 

// Set color to white, alpha to 1
draw_set(c_white, 1);

// Draw gui elements at 2x size
var gui_scale = 2;

// Get the size of the display_gui
var gui_size = gui_get_size();

// xx and yy represent the point to draw the next element to
var xx = floor(gui_size[Axis.X] * 0.5);
var yy = floor(gui_size[Axis.Y] * 0.5);

// Get the mouse position within the display_gui
var mousepoint = gui_get_mouse_pos();

// Draw the title sprite
draw_sprite_ext(spr_title, 0, xx, 128, gui_scale, gui_scale, 0, c_white, 1);

// -- Buttons --
// If not active, clicked is overridden to "none"
if (!active) clicked = MMButton.none;

// Start button
var spr = spr_mainmenu_button_start; // sprite of the button
var sub = 0; // subimage to draw
var sprw = ceil(sprite_get_width(spr)/2) * gui_scale; // width of the button sprite, scaled
var sprh = ceil(sprite_get_height(spr)/2) * gui_scale; // height of the button sprite, scaled
var isover = false; // is the mouse over this button?
var isclicked = false; // is the mouse clicking this button?

var button_pos = Point(xx, yy); // point to draw the button at
var button_rect = Rect(xx - sprw, yy - sprh, xx + sprw, yy + sprh); // rectangle of button collision

var over = MMButton.none; // the button the mouse is over

// Hover + Click
// If buttons are active, and mouse in this button rect
if (active && point_in_rect(mousepoint, button_rect))
{
	// If hover isn't the start button, then the mouse just entered it this frame
	if (hover != MMButton.start) 
	{
		// Play mouse-over SFX
		audio_play_sound(snd_ui_hover, 0.1, false);
	}
	
	// Set over to start button
	over = MMButton.start;
	
	// Set isover to true
	isover = true;
	
	// If left-click pressed
	if (mouse_check_button_pressed(mb_left))
	{
		// Set clicked to start button
		clicked = MMButton.start;
	}
	
	// If left-click released and it was clicked on the start button
	if (mouse_check_button_released(mb_left) && clicked == MMButton.start)
	{
		// Disable the main menu buttons
		active = false;
		
		// Play the ui submit SFX
		audio_play_sound(snd_ui_submit, 0.2, false);
		
		// Fade the main menu music out over 1 second
		music_fade(snd_soliloquy, 1);
		
		// Create a fade-out effect that will call mainmenu_signal_start when it finished fading out
		effect_fade_script(0, 1, 0.5, FadeMode.cosine, mainmenu_signal_start);
	}
}

// If clicked is start button
if (clicked == MMButton.start)
{
	// Set isclicked to true
	isclicked = true;
}

// Render

// Subimage is 0 - 3 based on whether mouse is over and/or clicked
sub = (isover ? 1 : 0) + (isclicked ? 2 : 0);

// If mouse over this button
if (isover)
{
	// Draw the hover graphics to the left and right of the button
	draw_sprite_ext(spr_mainmenu_hover, floor(sub/2), button_pos[Axis.X], button_pos[Axis.Y], gui_scale, gui_scale, 0, c_white, 1);
}
// Draw the button
draw_sprite_ext(spr, sub, button_pos[Axis.X], button_pos[Axis.Y], gui_scale, gui_scale, 0, c_white, 1);

// Clear isover to false, so next buttons don't all think the mouse is in them (graphically)
isover = false;

// <Put more buttons here>
// Basically copy-paste the whole start button code above, change "start" to whatever else
// Change what happens when it is left-clicked
// Make sure to change xx and yy so it draws each button in the right place


// If left-click not being held
if (!mouse_check_button(mb_left))
{
	// Set clicked to no button
	clicked = MMButton.none;
}

// Set hover to be what was being moused-over this frame
hover = over;