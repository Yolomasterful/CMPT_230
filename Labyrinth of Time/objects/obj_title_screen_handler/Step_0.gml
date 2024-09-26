var gamepad_number = 0;
var gamepad_deadzone = 0.3;

var key_up = keyboard_check(ord("W")) or keyboard_check(vk_up) or gamepad_button_check_pressed(gamepad_number, gp_padu);
var key_down = keyboard_check(ord("S")) or keyboard_check(vk_down) or gamepad_button_check_pressed(gamepad_number, gp_padd);

var select = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(gamepad_number, gp_face1) or gamepad_button_check_pressed(gamepad_number, gp_start)

if keyboard_check_pressed(vk_f11) {
	window_set_fullscreen(!window_get_fullscreen());
}

if (keyboard_check(vk_escape) or gamepad_button_check(gamepad_number, gp_select)) {
	game_end();
}
if (select) {
	switch (selected_button) {
		case 0:
			//Play
			room_goto(rm_desert);
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

if (key_up) {
	if (selected_button == 0) {
		selected_button = button_count - 1;
	}
	else {
		selected_button -= 1
	}
}

if (key_down) {
	if (selected_button == button_count - 1) {
		selected_button = 0;
	}
	else {
		selected_button += 1
	}
}