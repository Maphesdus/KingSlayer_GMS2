/// @arg heightdata
/// @arg tempdata
/// @arg moistdata
/// @arg datasize
var heightdata = argument0;
var tempdata = argument1;
var moistdata = argument2;
var datasize = argument3;

if (!is_array(heightdata)) return [];
if (!is_array(tempdata)) return [];
if (!is_array(moistdata)) return [];

var map = buffer_create(datasize * buffer_sizeof(buffer_u8), buffer_fixed, 1);
buffer_fill(map, 0, buffer_u8, __Tile.Water, buffer_get_size(map));
buffer_seek(map, buffer_seek_start, 0);

for(var i = 0; i < datasize; i++)
{
	var tile = __Tile.Water;
	
	var height = heightdata[i];
	var tempcelsius = map_range(tempdata[i], 0, 1, __lowtemp, __hightemp);
	var temp = degrees_ctof(tempcelsius);
	var moist = moistdata[i];
	
	if (height <= __sealevel)
	{
		if (temp <= 8) tile = __Tile.Ice;
		else tile = __Tile.Water;
	}
	else if (height <= __beachlevel)
	{
		if (temp <= 45)
		{
			tile = __Tile.Snow;
		}
		else
		{
			tile = __Tile.Sand;
		}
	}
	else if (height <= __mountainlevel)
	{
		if (temp <= 45)
		{
			tile = __Tile.Snow;
		}
		else if (temp <= 80)
		{
			tile = __Tile.Grass;
		}
		else
		{
			if (moist <= 0.5)
			{
				tile = __Tile.Sand;
			}
			else
			{
				tile = __Tile.Jungle;
			}
		}
	}
	else
	{
		var tempamt = sqrt(map_range(height, __mountainlevel, 1, 0, 1));
		temp = degrees_ctof(lerp(tempcelsius - 5, -5, tempamt));
		if (temp <= 32)
		{
			tile = __Tile.Snow;
		}
		else
		{
			tile = __Tile.Mountain;
		}
	}
	
	buffer_write(map, buffer_u8, tile);
}

return map;

enum __Tile
{
	Water,
	Ice,
	Sand,
	Grass,
	Jungle,
	Mountain,
	Snow,
	sizeof
}