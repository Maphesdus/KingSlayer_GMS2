/// @arg snd
var snd = argument0;

var musiccount = array_length_1d(MUSIC);
for(var i = 0; i < musiccount; i++)
{
	var snddata = MUSIC[i];
	var sndind = snddata[0];
	var sndid = snddata[1];
	if (sndind == snd)
	{
		snd = sndid;
		break;
	}
}

return snd;