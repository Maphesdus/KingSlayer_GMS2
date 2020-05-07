var musiccount = array_length_1d(MUSIC);
for(var i = 0; i < musiccount; i++)
{
	var snddata = MUSIC[i];
	//var sndind = snddata[0];
	var sndid = snddata[1];
	
	var gain = audio_sound_get_gain(sndid);
	if (gain <= 0)
	{
		audio_stop_sound(sndid);
		MUSIC = array_delete(MUSIC, i);
	}
}