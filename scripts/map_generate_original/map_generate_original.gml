/// @arg sprite
/// @arg subimg
var sprite = argument0, subimg = argument1;

var sprw = sprite_get_width(sprite);
var sprh = sprite_get_height(sprite);

var surf = surface_create(sprw, sprh);
surface_set_target(surf);
draw_set(c_white, 1);
draw_clear(c_black);
draw_sprite(sprite, subimg, 0, 0);

var buff = buffer_create(4 * sprw * sprh, buffer_grow, 1);
buffer_get_surface(buff, surf, buffer_surface_copy, 0, 0);

// Max pass
var maxval = 0;
buffer_seek(buff, buffer_seek_start, 0);
while(buffer_tell(buff) <= buffer_get_size(buff) - 4*buffer_sizeof(buffer_u8))
{
	var r = buffer_read(buff, buffer_u8);
	var g = buffer_read(buff, buffer_u8);
	var b = buffer_read(buff, buffer_u8);
	buffer_read(buff, buffer_u8);			// Skip alpha channel
	
	maxval = max(r, g, b, maxval);
}

// Main pass
maxval = maxval / 255;
buffer_seek(buff, buffer_seek_start, 0);
var pos = 0;

var total = 0;

while(buffer_tell(buff) <= buffer_get_size(buff) - 4*buffer_sizeof(buffer_u8))
{
	var r = buffer_read(buff, buffer_u8);
	var g = buffer_read(buff, buffer_u8);
	var b = buffer_read(buff, buffer_u8);
	buffer_read(buff, buffer_u8);			// Skip alpha channel
	
	var maxchannel = max(r, g, b) / 255;
	draw_set_color(make_color_hsv(0, 0, maxchannel * 255));
	var xx = pos % sprw;
	var yy = pos div sprw;
	total += maxchannel;
	switch(subimg)
	{
		default:
		case 0:
			heightmap(maxchannel / maxval);
			break;
		case 1:
			temperature(maxchannel, yy, sprh);
			break;
		case 2:
			moisture(maxchannel);
			break;
	}
	draw_point(xx, yy);
	pos++;
}
surface_reset_target();
surface_save(surf, "surf"+string(subimg)+".png");
surface_free(surf);