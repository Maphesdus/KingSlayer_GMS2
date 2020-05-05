/// @arg spritebase
/// @arg animation
/// @arg facingdir
/// @arg directions
var sprbase = argument0, anim = argument1, facedir = argument2, dirs = argument3;

if (!is_string(sprbase))
{
	show_error("animate expects {string} argument0", true);
}

if (!is_string(anim))
{
	show_error("animate expects {string} argument1", true);
}

if (!is_real(facedir))
{
	show_error("animate expects {real} argument2", true);
}

if (!is_real(dirs))
{
	show_error("animate expects {real} argument3", true);
}

var spr = asset_get_index(sprbase + (anim == "" ? "" : "_" + anim));
if (!sprite_exists(spr))
{
	return false;
}

sprite_index = spr;

var dirFrames = sprite_get_number(sprite_index) / floor(dirs);

image_index %= dirFrames;
image_index += facedir * dirFrames;

return true;