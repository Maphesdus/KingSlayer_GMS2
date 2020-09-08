/// @arg snd
/// @arg time
function music_fade() {
	var snd = argument[0], time = (argument_count > 1 ? argument[1] : 0);

	// Find the sound type in the MUSIC array
	snd = music_find(snd);

	if (audio_is_playing(snd))
	{
		audio_sound_gain(snd, 0, time * 1000);
	}


}
