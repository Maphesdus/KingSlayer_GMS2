/// @arg sprite
function map_generate(argument0) {
	var sprite = argument0;

	var sprw = sprite_get_width(sprite);
	var sprh = sprite_get_height(sprite);

	var surf = surface_create(sprw, sprh);
	surface_set_target(surf);
	draw_set(c_white, 1);
	draw_clear(c_black);
	draw_sprite(sprite, 0, 0, 0);

	var buff_heightmap = buffer_create(4 * sprw * sprh, buffer_grow, 1);
	buffer_get_surface(buff_heightmap, surf, buffer_surface_copy, 0, 0);

	draw_sprite(sprite, 1, 0, 0);

	var buff_temperature = buffer_create(4 * sprw * sprh, buffer_grow, 1);
	buffer_get_surface(buff_temperature, surf, buffer_surface_copy, 0, 0);

	draw_sprite(sprite, 2, 0, 0);

	var buff_moisture = buffer_create(4 * sprw * sprh, buffer_grow, 1);
	buffer_get_surface(buff_moisture, surf, buffer_surface_copy, 0, 0);

	var buff = buff_heightmap;

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

	var h = sprw * sprh - 1;
	var heightdata = -1;
	var tempdata = -1;
	var moistdata = -1;
	heightdata[h] = 0;
	tempdata[h] = 0;
	moistdata[h] = 0;

	var pos;

	for(var i = 0; i < sprite_get_number(sprite); i++)
	{
		switch(i)
		{
			default:
			case 0:
				buff = buff_heightmap;
				break;
			case 1:
				buff = buff_temperature;
				break;
			case 2:
				buff = buff_moisture;
				break;
		}
		buffer_seek(buff, buffer_seek_start, 0);
		pos = 0;
		while(buffer_tell(buff) <= buffer_get_size(buff) - 4*buffer_sizeof(buffer_u8))
		{
			var r = buffer_read(buff, buffer_u8);
			var g = buffer_read(buff, buffer_u8);
			var b = buffer_read(buff, buffer_u8);
			buffer_read(buff, buffer_u8);			// Skip alpha channel
	
			var maxchannel = max(r, g, b) / 255;
			var yy = pos div sprw;
		
			switch(i)
			{
				default:
				case 0:
					heightdata[pos] = heightmap(maxchannel / maxval);
					break;
				case 1:
					tempdata[pos] = temperature(maxchannel, yy, sprh);
					break;
				case 2:
					moistdata[pos] = moisture(maxchannel);
					break;
			}
			pos++;
		}
	}

	buffer_delete(buff_heightmap);
	buffer_delete(buff_temperature);
	buffer_delete(buff_moisture);

	var map = map_define(heightdata, tempdata, moistdata, sprw * sprh);
	buffer_seek(map, buffer_seek_start, 0);
	var mapsize = buffer_get_size(map);
	pos = 0;
	while(buffer_tell(map) < mapsize)
	{
		var xx = pos % sprw;
		var yy = pos div sprw;
	
		switch(buffer_read(map, buffer_u8))
		{
			default:
			case __Tile.Water:
				draw_set_color(merge_color(c_blue, c_aqua, 0.4));
				break;
			case __Tile.Ice:
				draw_set_color(merge_color(c_aqua, c_white, 0.4));
				break;
			case __Tile.Sand:
				draw_set_color(merge_color(c_yellow, c_white, 0.3));
				break;
			case __Tile.Grass:
				draw_set_color(c_green);
				break;
			case __Tile.Jungle:
				draw_set_color(c_lime);
				break;
			case __Tile.Mountain:
				draw_set_color(c_dkgray);
				break;
			case __Tile.Snow:
				draw_set_color(c_white);
				break;
		}
		draw_point(xx, yy);
		pos++;
	}

	buffer_delete(map);

	surface_reset_target();
	surface_save(surf, "map.png");
	surface_free(surf);


}
