// Loop through all music currently playing
var musiccount = array_length_1d(MUSIC);
for(var i = 0; i < musiccount; i++)
{
	// snddata is the music data at the current index "i"
	var snddata = MUSIC[i];
	
	// sndid is the actual audio resource/instance
	var sndid = snddata[1];
	
	// gain is the current volume of this track
	var gain = audio_sound_get_gain(sndid);
	if (gain <= 0)
	{
		// If the gain is <= 0, stop the sound and delete it from the MUSIC array
		audio_stop_sound(sndid);
		MUSIC = array_delete(MUSIC, i);
	}
}