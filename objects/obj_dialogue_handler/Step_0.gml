/// @description 
index_acc += spd * system.secPass;

while(index_acc >= 1)
{
	index_acc--;
	index = min(string_advance(text, index), string_length(text));
}