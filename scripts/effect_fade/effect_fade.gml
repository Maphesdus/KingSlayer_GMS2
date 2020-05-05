/// @arg startalpha
/// @arg destalpha
/// @arg duration
/// @arg mode
var fade = spawn(fx_fade);
fade.startalpha = argument0;
fade.alpha = argument0;
fade.destalpha = argument1;
fade.duration = argument2;
fade.mode = argument3;
return fade;