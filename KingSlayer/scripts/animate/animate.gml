/// @arg spritebase
/// @arg animation
/// @arg facingdir
/// @arg directions
function animate(argument0, argument1, argument2, argument3) {
	var sprbase = argument0, anim = argument1, facedir = argument2, dirs = argument3;

	// Fail-safes
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

	// spr is the sprite resource with the name built by the given arguments
	// If the passed animation is an empty string, it will simply find a sprite with the name of sprite_base
	var spr = asset_get_index(sprbase + (anim == "" ? "" : "_" + anim));
	if (!sprite_exists(spr))
	{
		// If the given sprite doesn't exist, return false
		return false;
	}

	// Update sprite_index to the found sprite
	sprite_index = spr;

	// Frames for each direction
	var dirFrames = sprite_get_number(sprite_index) / floor(dirs);

	// For image_index to be in the range of 0 - (dirFrames - 1)
	image_index %= dirFrames;

	// Add facing direction * frames per direction as the offset into the subimages
	image_index += facedir * dirFrames;

	// Return true, since the sprite was set successfully
	return true;


}
