/// @description Populate Render Priority
ds_priority_clear(render_pri);

with(par_entity)
{
	if (!render) continue;
	ds_priority_add(other.render_pri, id, -y + (x / 1000));
}