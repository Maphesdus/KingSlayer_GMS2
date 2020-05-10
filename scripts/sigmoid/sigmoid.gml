/// @arg x
/// @arg n=e
var xx = argument[0];
var e = (argument_count > 1 ? argument[1] : 2.7182818284590452353602874713527);
var ex = power(e, xx);
return ex / (ex + 1);