//Menu
global.menu_pause = keyboard_check_pressed(vk_escape) or keyboard_check_pressed(ord("P")) or gamepad_button_check(global.gamepad_number, gp_start);
global.menu_up = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up) or gamepad_button_check_pressed(global.gamepad_number, gp_padu);
global.menu_down = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down) or gamepad_button_check_pressed(global.gamepad_number, gp_padd);