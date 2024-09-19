var key_right = keyboard_check(ord("D")) or keyboard_check(vk_right) or gamepad_axis_value(gamepad_number, gp_axislh) < -gamepad_deadzone;
var key_left = keyboard_check(ord("A")) or keyboard_check(vk_left) or gamepad_axis_value(gamepad_number, gp_axislh) > gamepad_deadzone;
var key_up = keyboard_check(ord("W")) or keyboard_check(vk_up) or keyboard_check(vk_space);
var key_down = keyboard_check(ord("S")) or keyboard_check(vk_down);

//var action_jump = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(gamepad_number, gp_face1); 

if keyboard_check_pressed(vk_f11) {
	window_set_fullscreen(!window_get_fullscreen());
}

if (keyboard_check(vk_escape)) {
	game_end();
}

//Apply Player Movement
horizontal_speed = (key_right - key_left) * walk_speed;
vertical_speed = (key_down - key_up) * walk_speed;

//Fix Diagonal Movement
if ((key_right + key_left + key_up + key_down == 2) and (key_right + key_left != 2) and (key_up + key_down != 2)) {
	horizontal_speed = horizontal_speed * 0.8;
	vertical_speed = vertical_speed * 0.8;
}
else {show_debug_message(" ");}

// Horizontal Movement and Boundary Check
if (check_collision(x + horizontal_speed, y, collision_objects)) {
	while (!check_collision(x + sign(horizontal_speed), y, collision_objects)) {
	    x += sign(horizontal_speed);
	}
	horizontal_speed = 0;
}
x += horizontal_speed;

// Vertical Movement and Boundary Check
if (check_collision(x, y + vertical_speed, collision_objects)) {
	while (!check_collision(x, y + sign(vertical_speed), collision_objects)) {
	    y += sign(vertical_speed);
	}
	vertical_speed = 0;
}
y += vertical_speed;

x = round(x);
y = round(y);