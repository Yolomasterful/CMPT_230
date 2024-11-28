global.menu_up = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up) or gamepad_button_check_pressed(global.gamepad_number, gp_padu);
global.menu_down = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down) or gamepad_button_check_pressed(global.gamepad_number, gp_padd);
global.menu_left = keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_left) or gamepad_button_check_pressed(global.gamepad_number, gp_padl);
global.menu_right = keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right) or gamepad_button_check_pressed(global.gamepad_number, gp_padr);
global.menu_select = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("E")) or gamepad_button_check_pressed(global.gamepad_number, gp_face1) or gamepad_button_check_pressed(global.gamepad_number, gp_start)

if keyboard_check_pressed(vk_f11) {
	window_set_fullscreen(!window_get_fullscreen());
	if (window_get_fullscreen()) {
		buttons[1, 0] = "Window Size\nFullscreen";
	} else {
		buttons[1, 0] = "Window Size\nWindowed";
	}
}

if (!global.paused and room != rm_title_screen) {
	exit;
}

if (room == rm_title_screen) {
	center_x = room_width/2;
	center_y = room_height/2;
} else {
	center_x = camera_get_view_width(view_camera[0])/2;
	center_y = camera_get_view_height(view_camera[0])/2;
}

button_count = array_length(buttons[button_level]);

switch (button_level) {
	case 0:
		if (room == rm_title_screen) { //Main Menu
			x = org_x;
			y = org_y;
			scale = 1;
			width = scale * 352;
			height = scale * 416;
			button_space = 60;
			button_top_border = 130;
			button_scale = 1;
		} else { // Pause Menu
			x = center_x;
			y = center_y;
			scale = 0.8;
			width = scale * 352;
			height = scale * 416;
			button_space = 60;
			button_top_border = 100;
			button_scale = 0.7;
		}
		break;
	case 1:
		if (room == rm_title_screen) {
			x = center_x;
			y = center_y;
			scale = 2;
			width = scale * 352;
			height = scale * 416;
			button_space = 100;
			button_top_border = 200;
			button_scale = 1;
		} else {
			x = center_x;
			y = center_y;
			scale = 1.3;
			width = scale * 352;
			height = scale * 416;
			button_space = 70;
			button_top_border = 100;
			button_scale = 0.7;
			
		}
		break;
	
}

if (button_level == 1 and (1 <= selected_button and selected_button <= 3) and not (global.menu_up or global.menu_down)) {
	global.menu_select = true;
}

selected_button += global.menu_down - global.menu_up
if (global.menu_up or global.menu_down) {audio_play_sound(snd_ui_1, 1, false, global.master_vol*global.sfx_vol);}
if (selected_button >= button_count) {selected_button = 0;}
if (selected_button < 0) {selected_button = button_count - 1;}

if (global.menu_select) {
	if ((selected_button != button_count - 1) and not (button_level == 1 and (1 <= selected_button and selected_button <= 3))) {
		audio_play_sound(snd_ui_2, 1, false, global.master_vol*global.sfx_vol);
		
	} else if ((selected_button != button_count - 1) and (global.menu_left or global.menu_right)) {
		audio_play_sound(snd_ui_1, 1, false, global.master_vol*global.sfx_vol);
	}
	switch (button_level) {
		case 0:
			if (room == rm_title_screen) {
				switch (selected_button) {
					case 0:
						room_goto(rm_desert);
						break;
					case 1:
						button_level = 1;
						button_count = array_length(buttons[button_level]);
						selected_button = 0;
						break;
					case 2:
						game_end();
						break;
				}
			} else {
				switch (selected_button) {
					case 0:
						
						break;
					case 1:
						button_level = 1;
						button_count = array_length(buttons[button_level]);
						selected_button = 0;
						break;
					case 2:
						room_goto(rm_title_screen);
						break;
				}
			}
		break;
		case 1:
			switch (selected_button) {
				case 0:
					window_set_fullscreen(!window_get_fullscreen());
					if (window_get_fullscreen()) {
						buttons[1, 0] = "Window Size\nFullscreen";
					} else {
						buttons[1, 0] = "Window Size\nWindowed";
					}
					break;
				case 1:
					if (global.menu_left and global.master_vol > 0) {
						global.master_vol -= 0.1;
					} else if (global.menu_right and global.master_vol < 1) {
						global.master_vol += 0.1;
					}
					buttons[1, 1] = "Master Volume\n"
					for (var i = 0; i < global.master_vol*10; i++) {
						buttons[1, 1] += "█";
					}
					break;
				case 2:
					if (global.menu_left and global.music_vol > 0) {
						global.music_vol -= 0.1;
					} else if (global.menu_right and global.music_vol < 1) {
						global.music_vol += 0.1;
					}
					buttons[1, 2] = "Music Volume\n";
					for (var i = 0; i < global.music_vol*10; i++) {
						buttons[1, 2] += "█";
					}
					break;
				case 3:
					if (global.menu_left and global.sfx_vol > 0) {
						global.sfx_vol -= 0.1;
					} else if (global.menu_right and global.sfx_vol < 1) {
						global.sfx_vol += 0.1;
					}
					buttons[1, 3] = "SFX Volume\n";
					for (var i = 0; i < global.sfx_vol*10; i++) {
						buttons[1, 3] += "█";
}
					break;
				case 4:
					button_level = 0;
					button_count = array_length(buttons[button_level]);
					selected_button = 1;
					break;
			}
	}
}
show_debug_message("Paused: " + string(global.paused));
