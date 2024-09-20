if keyboard_check_pressed(vk_f11) {
	window_set_fullscreen(!window_get_fullscreen());
}

if (keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space)) {
	switch (selected_button) {
		case 0:
			//Play
			room_goto(rm_floor1_start);
			break;
		case 1:
			//Options
			break;
		case 2:
			//Exit
			game_end();
			break;
	}
}

if (keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))) {
	if (selected_button == 0) {
		selected_button = button_count - 1;
	}
	else {
		selected_button -= 1
	}
}

if (keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"))) {
	if (selected_button == button_count - 1) {
		selected_button = 0;
	}
	else {
		selected_button += 1
	}
}