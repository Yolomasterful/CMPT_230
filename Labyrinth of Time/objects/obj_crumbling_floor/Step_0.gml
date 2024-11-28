if (place_meeting(x, y, obj_player) and !crumbled) {
	touched = true;
}
if (touched and image_index == 0) {
	audio_play_sound(snd_tilecrumble, 1, 0, global.master_vol*global.sfx_vol);
}
if touched {
	if (image_index < 17) {
		image_speed = 2;
	} else if (image_index >= 17) {
		image_speed = 0;
		image_index = 17;
		touched = false;
		crumbled = true;
		current_revert_delay = default_revert_delay;
	}
} else if (!touched and current_revert_delay == 0) {
	if (image_index > 1) {
		image_speed = -4;
	} else if (image_index < 1) {
		image_speed = 0;
		image_index = 0;
		touched = false;
	}
	if image_index < 3 {
		crumbled = false;
	}
} else {
	current_revert_delay--;
}