/// @arg snd
/// @arg time=0
function music_play() {
	var snd = argument[0], time = (argument_count > 1 ? argument[1] : 0)

	snd = music_find(snd);

	if (!audio_is_playing(snd))
	{
		append(MUSIC, [snd, audio_play_sound(snd, 1, true)]);
	}
	else
	{
		audio_sound_gain(snd, 1, max(1, time * 1000));
	}


}
