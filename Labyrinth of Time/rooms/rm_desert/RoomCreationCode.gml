create_boundaries(32, 32);

//window_set_size(1024+256, 1024);
floor_music = audio_play_sound(msc_desert, 1, true);
instance_create_layer(0, 0, "Logic", obj_pause);
instance_create_layer(2048, 2048, "Logic", obj_menu);