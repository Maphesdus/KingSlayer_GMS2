/// @description 
if (indialogue)
{
	// Setup
	draw_set(c_white, 1, ft_dialogue_huge, fa_left, fa_top);
	var gui_size = gui_get_size();
	var gui_scale = gui_size[Axis.X] / 480;
	
	// UI
	draw_sprite_ext(spr_dialogue, 0, 0, gui_size[Axis.Y], gui_scale, gui_scale, 0, c_white, 1);
	
	// Text
	var text_pos = Point(map_range(130, 0, 480, 0, gui_size[Axis.X]), map_range(187, 0, 270, 0, gui_size[Axis.Y]));
	
	// This script is super complicated, don't event open it
	// Example string: "[FF0000]Hello[/]!" draws "Hello" in red (RRGGBB hex value), and "!" in whatever you draw_set_color to before
	// [f=FONT_NAME]___[/] sets the font
	// Stack-based, so "[FF0000]H[0000FF]e[/]llo[/]!" draws "H" red, "e" blue, "llo" red, "!" in what you draw_set_color to before
	draw_text_tags(text_pos[Axis.X], text_pos[Axis.Y], string_copy(text, 1, index), 333 * gui_scale);
	
	// Name
	var name_pos = Point(map_range(128, 0, 480, 0, gui_size[Axis.X]), map_range(165, 0, 270, 0, gui_size[Axis.Y]));
	draw_text(name_pos[Axis.X], name_pos[Axis.Y], name);
}