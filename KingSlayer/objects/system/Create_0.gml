/// @description 

/*

The system object is a persistent object that must never be destroyed.
It acts as a sort of global object that handles a few important tasks.
It handles delta timing and resizing graphics correctly when the window is resized.
It also handles in-game systems, such as music.

*/


// Randomize the game seed so random calls are different each playthrough
randomize();

// delta is short for "Delta Time", and when it equals 1, the game speed is running perfectly
// >1, the game is running slowly, so physics and graphics need to update faster.
// <1, the game is running quickly, so everything should update slower. This is very rare.
delta = 1;

// secPass stores the amount of seconds that have passed since the previous frame
// Useful for timers or things that work with raw seconds, rather than frames
secPass = 1/game_get_speed(gamespeed_fps);

// Window size
window_width = window_get_width();
window_height = window_get_height();