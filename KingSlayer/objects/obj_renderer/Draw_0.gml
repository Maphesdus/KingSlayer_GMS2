/// @description 
while(!ds_priority_empty(render_pri))
{
	with(ds_priority_delete_max(render_pri))
	{
		// Manually call the draw event of every object in the priority list, in order of priority value
		event_perform(ev_draw, 0);
	}
}