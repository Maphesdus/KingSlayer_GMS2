/// @arg startalpha
/// @arg destalpha
/// @arg duration
/// @arg mode
/// @arg script
/// @arg ...
function effect_fade_script() {
	var fade = spawn(fx_fade);
	fade.startalpha = argument[0];
	fade.alpha = argument[0];
	fade.destalpha = argument[1];
	fade.duration = argument[2];
	fade.mode = argument[3];
	fade.signal = argument[4];

	for(var i = 5; i < argument_count; i++)
	{
		append(fade.args, argument[i]);
	}


	return fade;


}
