if (image_speed != 1 and image_index < 11 and obj_gem_socket_blue.image_index == 1 and obj_gem_socket_green.image_index == 1 and obj_gem_socket_pink.image_index == 1 and obj_gem_socket_yellow.image_index == 1) {
	image_speed = 1;
	audio_play_sound(snd_door_opening, 10, false, global.master_vol*global.sfx_vol);
} else if (image_index >= 11) {
	image_speed = 0;
}