/// @description 
if (duration == 0)
{
	instance_destroy();
	exit;
}

amt += (1 / duration) * system.secPass;
switch(mode)
{
	case FadeMode.linear:
		alpha = lerp(startalpha, destalpha, amt);
		break;
	case FadeMode.cosine:
		alpha = coserp(startalpha, destalpha, amt);
		break;
	case FadeMode.linearaverage:
		alpha = lerp(startalpha, destalpha, lerp(amt, 1, 0.2));
		break;
}

if (amt >= 1) instance_destroy();