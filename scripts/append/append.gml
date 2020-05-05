/// @arg ds
/// @arg val
var ds = argument0, val = argument1;

switch(typeof(ds))
{
	case "array":
		ds[@ array_length_1d(ds)] = val;
		break;
	case "real":
		if (ds_exists(ds, ds_type_list))
		{
			ds_list_add(ds, val);
		}
		else if (ds_exists(ds, ds_type_stack))
		{
			ds_stack_push(ds, val);
		}
		else if (ds_exists(ds, ds_type_queue))
		{
			ds_queue_enqueue(ds, val);
		}
		else show_error("append expects {array, ds_list, ds_stack, or ds_queue} argument0", false);
		break;
	default:
		show_error("append expects {array, ds_list, ds_stack, or ds_queue} argument0", false);
		break;
}