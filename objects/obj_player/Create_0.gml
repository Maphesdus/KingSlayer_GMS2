/// @description 

// Inherit par_entity create event
event_inherited();

// Set velocity to a 2D vector with both components set to 0
velocity = Vec2(0, 0);

// Walking speed in pixels / step
spd = 2;

// Acceleration in pixels / step squared
accel = 0.35;

// Friction in pixels / step squared
fric = 0.25;

// Fractional velocity. Used to guarantee player's x and y are integers, looks better
fracvelocity = Vec2(0, 0);

// Facing direction, from 0 - 3 (4 directional) or 0 - 7 (8 directional), etc.
facingDir = 0;

// The base name of the sprites used by the player (they all start with "spr_player")
sprite_base = "spr_player";

// The current animation as a string. Combined with sprite_base to set the sprite_index
animation = "idle";

// Flag whether the player is in an attack animation or not
attacking = false;

// The physics is simulated every time this surpasses 1, sometimes multiple times per step if laggy.
delta_accumulation = 0;

// Flag whether to use delta timing (if false, simulates physics once every step)
delta_timing = true;