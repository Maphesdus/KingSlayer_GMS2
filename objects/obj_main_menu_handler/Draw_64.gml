/// @description 

draw_set(c_white, 1);

var gui_scale = 2;
var gui_size = gui_get_size();

var xx = floor(gui_size[Axis.X] * 0.5);
var yy = floor(gui_size[Axis.Y] * 0.5);
var mousepoint = gui_get_mouse_pos();

draw_sprite_ext(spr_title, 0, xx, 128, gui_scale, gui_scale, 0, c_white, 1);

// Buttons
if (!active) clicked = MMButton.none;

// Start
var spr = spr_mainmenu_button_start;
var sub = 0;
var sprw = ceil(sprite_get_width(spr)/2) * gui_scale;
var sprh = ceil(sprite_get_height(spr)/2) * gui_scale;
var isover = false;
var isclicked = false;

var button_pos = Point(xx, yy);
var button_rect = Rect(xx - sprw, yy - sprh, xx + sprw, yy + sprh);

var over = MMButton.none;

// Hover + Click
if (active && point_in_rect(mousepoint, button_rect))
{
	if (hover != MMButton.start)
	{
		// SFX
		audio_play_sound(snd_ui_hover, 0.1, false);
	}
	over = MMButton.start;
	isover = true;
	if (mouse_check_button_pressed(mb_left))
	{
		clicked = MMButton.start;
	}
	if (mouse_check_button_released(mb_left) && clicked == MMButton.start)
	{
		active = false;
		audio_play_sound(snd_ui_submit, 0.2, false);
		music_fade(snd_soliloquy, 1);
		effect_fade_script(0, 1, 0.5, FadeMode.cosine, mainmenu_signal_start);
	}
}
if (clicked == MMButton.start)
{
	isclicked = true;
}

// Render
sub = (isover ? 1 : 0) + (isclicked ? 2 : 0);

if (isover)
{
	draw_sprite_ext(spr_mainmenu_hover, floor(sub/2), button_pos[Axis.X], button_pos[Axis.Y], gui_scale, gui_scale, 0, c_white, 1);
}
draw_sprite_ext(spr, sub, button_pos[Axis.X], button_pos[Axis.Y], gui_scale, gui_scale, 0, c_white, 1);

if (!mouse_check_button(mb_left))
{
	clicked = MMButton.none;
}

isover = false;

hover = over;