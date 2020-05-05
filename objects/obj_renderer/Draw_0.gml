/// @description 
while(!ds_priority_empty(render_pri))
{
	with(ds_priority_delete_max(render_pri))
	{
		event_perform(ev_draw, 0);
	}
}