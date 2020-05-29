/// @description Populate Render Priority
ds_priority_clear(render_pri);

// Add every entity to the priority list if "render" is true.
// The priority value is based on -y mostly, but x/1000 is added so overlapping objects with the same y don't flicker
with(par_entity)
{
	if (!render) continue;
	ds_priority_add(other.render_pri, id, -y + (x / 1000));
}