/// @description Trigger Signal
if (!is_undefined(signal) && script_exists(signal))
{
	execute(signal, args);
}