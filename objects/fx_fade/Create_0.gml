/// @description 
duration = 0;				// in seconds
startalpha = 1;
destalpha = 0;
color = $000000;
mode = FadeMode.linear;

signal = undefined;
args = [];

amt = 0;
alpha = 1;

enum FadeMode
{
	linear,
	cosine,
	linearaverage
}