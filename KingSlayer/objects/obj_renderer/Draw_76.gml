/// @description 

// Make sure entities still perform pre-draw event for animating, as the event won't trigger if object is !visible
with(par_entity)
{
	event_perform(ev_draw, ev_draw_pre);
}