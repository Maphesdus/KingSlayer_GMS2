/// @description 
timer -= system.secPass;
if (timer <= 0 && !spawned)
{
	spawned = true;
	effect_fade_script(0, 1, 1.5, FadeMode.cosine, prescreen_signal_end);
}