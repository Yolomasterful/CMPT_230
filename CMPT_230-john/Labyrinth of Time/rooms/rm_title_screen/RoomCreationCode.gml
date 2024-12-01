global.gamepad_number = 0;
global.gamepad_deadzone = 0.3;

global.paused = false;

global.master_vol = 1.0
global.music_vol = 0.5
global.sfx_vol = 0.5

window_set_fullscreen(true);

instance_create_layer(512, 608, "Logic", obj_menu);
instance_create_layer(0, 0, "Logic", obj_title);
instance_create_layer(0, 0, "Logic", obj_music);