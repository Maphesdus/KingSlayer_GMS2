/// @description Delta Timing

// Set secPass to be the number of seconds since last frame
secPass = delta_time/1000000;

// Set delta to the deviation from intended fps, in percent
delta = secPass*game_get_speed(gamespeed_fps);

// Update the music system
music_update();